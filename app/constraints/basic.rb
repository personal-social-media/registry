# frozen_string_literal: true

class Basic
  def self.matches?(request)
    return true unless Rails.env.production?

    if ActionController::HttpAuthentication::Basic.has_basic_credentials?(request)
      credentials = ActionController::HttpAuthentication::Basic.decode_credentials(request)
      email, password = credentials.split(":")

      email == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end
end
