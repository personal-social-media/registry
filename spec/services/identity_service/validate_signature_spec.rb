# frozen_string_literal: true

require "rails_helper"

describe IdentityService::ValidateSignature do
  let(:signature) do
    "3FF3HEL3MVJFJZJDJCEZRZT3RIXOOQN4J5U45VKV6ETFZONNNYREAMOGLXRMY7PUNLQAZWVAIY6HQGECG7MFPZMM7NS3JOHY3AA35PIDRLOXQOWRDK4WETYU5OMWZJZNGYYMU2H7RNHWDYDNIXO5TYCTTLB5WJCBMITXMDVMPLNZC5XF7EQVU2WI6FEL2YQDRQGRLRYBQIOWRYFPU4VSLJOVHZSFCKMUUIOTMGOVXVEK5VAMQE7MSXXDYDEGOE7BRLW55J3FEIPALSGAXE76NMKYNZ3IND6SZ3T6KJFCGRWZ7ZQ6IEQERJLFZDDA3WSI4SSISLEQV3LJYVPO72S7RFXVZEACLCLJB7J6W6HPXKVKJLMVN7SGQJEOFMVSGS2MEQE3XQMTOWTSPG2VDTQM3RZXTE======"
  end

  let(:public_key) do
    "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA65B1VaClpiQq1LazpP8q
r+s+80oxYfEGzCpD7swJuSlY03gqoaPw2vGLfywU3RYbbL6YBCV/jEExIRvaIAan
YOmfyrNNMu65KSNVpwgum83FdLXOnkhrCOs+YDnRBKdWQxA5CpCg2bIAQ1jHDoKc
zXPb7ujofTYMTq25rxfjG0SUs0XsV4MdODqK+fKImHCm2+Cg12OSib0Qzwh6V5X3
5t1ieHVTZFi5PuYufkK1O6IXw8YlKeQRlBtm0uUM8THDZD60cIQnF9MtH82fNkHa
HmjeDOLy/GAYifsQGxhhOqzb01/5SYmYndr/Wgh93g4ijQ1XzTOZX3JcgXnB92l2
vwIDAQAB
-----END PUBLIC KEY-----"
  end

  let(:identity) do
    create(:identity, signature: signature, username: "username-1", server_ip: "0.0.0.0", name: "name-1", avatars: nil, public_key: public_key)
  end

  subject do
    described_class.new(identity).call!
  end

  it "verifies the signature" do
    expect(subject).to be_truthy
  end
end
