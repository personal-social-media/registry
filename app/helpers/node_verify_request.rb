# frozen_string_literal: true

module NodeVerifyRequest
  def verify_node_request
    head 403 unless IdentityService::VerifyRequest.new(
      request.original_url,
      request.headers["Public-Key"],
      request.headers["Url-Signed"],
      request.headers["Real-User-Agent"],
      request.headers["Client"]
    ).call!
  end
end
