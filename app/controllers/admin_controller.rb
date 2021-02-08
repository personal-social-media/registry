# frozen_string_literal: true

class AdminController < ApplicationController
  def login_post
    login_params = params.require(:login).permit(:username, :password)

    if login_params[:username] == ENV["ADMIN_USERNAME"] && login_params[:password] == ENV["ADMIN_PASSWORD"]
      session["ADMIN_USERNAME"] = ENV["ADMIN_USERNAME"]
      session["ADMIN_PASSWORD"] = ENV["ADMIN_PASSWORD"]
    else
      return render :login
    end

    redirect_to "/super-admin"
  end
end
