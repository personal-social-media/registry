# frozen_string_literal: true

class SslController < ApplicationController
  # include NodeVerifyRequest
  # before_action :verify_node_request, only: %i(create)

  def create
    @ssl_service = SslService::Create.new(ip)
    send_file(@ssl_service.certificate.path, type: "text/plain", filename: "certificate.pem")
  end
end
