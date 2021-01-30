# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/identities" do
  describe "GET /identities" do
    before { create_list(:identity, 8) }

    subject do
      get url
    end

    context "empty search" do
      let(:url) { "/identities" }

      it "gets" do
        subject

        expect(response).to have_http_status(:ok)
        expect(json[:identities].size).to eq 0
      end
    end
  end

  describe "POST /identities" do
    let(:url) { "/identities" }
    let(:signed_url) { "http://www.example.com/identities" }
    let(:params) { {identity: { name: "a", username: "a" } }}
    let(:headers) { signed_headers(signed_url) }

    subject do
      post url, params: params, headers: headers
    end

    it "saves" do
      subject

      expect(response).to have_http_status(:ok)
    end
  end
end
