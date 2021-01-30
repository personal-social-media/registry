# frozen_string_literal: true

module SslService
  class Create
    attr_reader :ip

    def initialize(ip)
      @ip = ip
    end

    def certificate
      return @certificate if @certificate
      root_ca = OpenSSL::X509::Certificate.new
      root_ca.version = 2 # cf. RFC 5280 - to make it a "v3" certificate
      root_ca.serial = 1
      root_ca.subject = OpenSSL::X509::Name.parse "/DC=net/DC=personalsocialmedia/CN=#{ip}"
      root_ca.issuer = root_ca.subject # root CA's are "self-signed"
      root_ca.public_key = private_key.public_key
      root_ca.not_before = Time.now
      root_ca.not_after = root_ca.not_before + 10 * 365 * 24 * 60 * 60 # 10 years validity
      ef = OpenSSL::X509::ExtensionFactory.new
      ef.subject_certificate = root_ca
      ef.issuer_certificate = root_ca
      root_ca.add_extension(ef.create_extension("basicConstraints", "CA:TRUE", true))
      root_ca.add_extension(ef.create_extension("keyUsage", "keyCertSign, cRLSign", true))
      root_ca.add_extension(ef.create_extension("subjectKeyIdentifier", "hash", false))
      root_ca.add_extension(ef.create_extension("authorityKeyIdentifier", "keyid:always", false))
      root_ca.add_extension(ef.create_extension("subjectAltName", "IP:#{ip}", false))
      signed_cert = root_ca.sign(private_key, OpenSSL::Digest::SHA256.new)
      @certificate = Tempfile.new.tap do |tmp|
        tmp.write(signed_cert.to_pem)
        tmp.rewind
      end
    end

    def private_key
      return @@private_key if defined? @@private_key
      key = File.read(Rails.root.join("vendor/keys/private_key.pem"))

      @@private_key = OpenSSL::PKey::RSA.new(key)
    end
  end
end
