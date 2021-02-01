# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ssl" do
  describe "POST /ssl" do
    let(:signed_url) { "http://www.example.com/ssl" }
    let(:headers) { signed_headers(signed_url) }

    subject do
      post "/ssl", headers: headers
    end

    it "ok" do
      subject

      expect(response).to have_http_status(:ok)
    end
  end
end
