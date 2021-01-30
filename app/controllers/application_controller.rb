# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private
    def ip
      return request.headers["CF-Connecting-IP"] if Rails.env.production?
      request.remote_ip
    end
end
