# frozen_string_literal: true

module IdentityService
  module SignedRequest
    def signed_headers(url)
      {
        "User-Agent": "Personal Social Media",
        "Url-Signed": _private_key.sign(OpenSSL::Digest::SHA256.new, url),
        "Public-Key": _private_key.public_key.to_pem,
      }
    end

    def _private_key
      return @@private_key if defined? @@private_key
      key = File.read(Rails.root.join("vendor/keys/private_key.pem"))
      @@private_key ||= OpenSSL::PKey::RSA.new(key)
    end
  end
end
