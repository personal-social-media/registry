class NewUpdateWorker < ApplicationWorker
  include IdentityService::SignedRequest
  attr_reader :internet, :barrier
  def perform
    Async do
      @internet = Async::HTTP::Internet.new
      @barrier = Async::Barrier.new

      Identity.find_in_batches(batch_size: 20) do |group|
        handle_group(group)
      end
    end
  ensure
    internet&.close
  end

  def handle_group(group)
    group.each do |identity|
      barrier.async do
        Timeout.timeout(2000) do
          url = build_url(identity)
          internet.get(url, signed_headers(url).to_a)
          identity.touch
        end

      rescue Timeout::Error, Errno::ECONNREFUSED
      rescue Exception => e
        if Rails.env.production?
          Bugsnag.notify(e)
        else
          raise e
        end
      end
    end
  end

  def build_url(identity)
    "https://#{identity.server_ip}/new-update"
  end
end