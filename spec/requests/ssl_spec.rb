# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ssl" do
  describe "POST /ssl" do
    subject do
      post "/ssl"
    end

    it "ok" do
      subject

      expect(response).to have_http_status(:ok)
    end
  end
end
