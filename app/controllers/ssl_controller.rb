# frozen_string_literal: true

class SslController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def create
    @ssl_service = SslService::Create.new(request.remote_ip)
    send_file(@ssl_service.certificate.path, type: "text/plain", filename: "certificate.pem")
  end
end
