# frozen_string_literal: true

require "rails_helper"

RSpec.describe "updates" do
  describe "/new-update" do
    let(:url) { "/new-update" }
    before { create_list(:identity, 2) }

    subject do
      post url
    end

    it "triggers updates" do
      subject

      expect(response).to have_http_status(:ok)
    end
  end
end