# frozen_string_literal: true

class UpdatesController < ApplicationController
  before_action :verify_token if Rails.env.production?
  skip_before_action :verify_authenticity_token

  def trigger
    NewUpdateWorker.perform_async
    head :ok
  end

  private
    def verify_token
      head 403 unless params[:token] == ENV["UPDATES_TOKEN"]
    end
end
