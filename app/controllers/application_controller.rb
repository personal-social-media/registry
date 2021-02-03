# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private
    def ip
      request.headers["Gateway"]
    end
end
