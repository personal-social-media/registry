# frozen_string_literal: true

class AdminController < ApplicationController
  def login_post
    p = params.require(:login).permit(:username, :password)

    if p[:username] == ENV["ADMIN_USERNAME"] && p[:password] == ENV["ADMIN_PASSWORD"]
      session["ADMIN_USERNAME"] = ENV["ADMIN_USERNAME"]
      session["ADMIN_PASSWORD"] = ENV["ADMIN_PASSWORD"]
    else
      return render :login
    end

    redirect_to "/super-admin"
  end
end
