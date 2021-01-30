# frozen_string_literal: true

class SslController < ApplicationController
  def create
    @ssl_service = SslService::Create.new(ip)
    send_file(@ssl_service.certificate.path, type: "text/plain", filename: "certificate.pem")
  end
end
