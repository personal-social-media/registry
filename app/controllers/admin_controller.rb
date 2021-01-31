# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], only: :login if Rails.env.production?

  def login
    session["ADMIN_USERNAME"] = ENV["ADMIN_USERNAME"]
    session["ADMIN_PASSWORD"] = ENV["ADMIN_PASSWORD"]

    render plain: "Logged in"
  end
end
