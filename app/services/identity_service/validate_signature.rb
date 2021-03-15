# frozen_string_literal: true

module IdentityService
  class ValidateSignature
    attr_reader :identity

    def initialize(identity)
      @identity = identity
    end

    def call!
      pk = OpenSSL::PKey::RSA.new(public_key)
      pk.verify(OpenSSL::Digest::SHA256.new, Base32.decode(signature), identity_json)
    end

    private
      def identity_json
        {
          username: username,
          name: name,
          avatars: avatars,
          ip: server_ip
        }.to_json
      end

      delegate :public_key, :signature, :username, :name, :avatars, :server_ip, to: :identity
  end
end
