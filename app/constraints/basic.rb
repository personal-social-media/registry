# frozen_string_literal: true

class Basic
  def self.matches?(request)
    return true unless Rails.env.production?

    request.session["ADMIN_USERNAME"] == ENV["ADMIN_USERNAME"] &&
      request.session["ADMIN_PASSWORD"] == ENV["ADMIN_PASSWORD"]
  end
end
