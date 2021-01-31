# frozen_string_literal: true

class IdentitiesController < ApplicationController
  include NodeVerifyRequest
  before_action :verify_node_request, only: %i(create)

  def index
    search = params[:q]
    return @identities = [] if search.blank?

    @identities = Identity.username_similar(search).paginate(page: params[:page], per_page: 8)
  end

  def create
    @identity = Identity.find_or_initialize_by(public_key: request.headers["Public-Key"]).tap do |id|
      permitted_params = params.require(:identity).permit(:username, :name, :avatar_url)
      unless id.persisted?
        id.username = permitted_params[:username]
      end
      id.name = permitted_params[:name]
      id.avatar_url = permitted_params[:avatar_url]
      id.server_ip = ip
      id.save!
    end
  end
end
