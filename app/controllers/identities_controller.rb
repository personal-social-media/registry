# frozen_string_literal: true

class IdentitiesController < ApplicationController
  include NodeVerifyRequest
  before_action :verify_node_request, only: %i(create)
  skip_before_action :verify_authenticity_token, only: %i(create)

  def index
    search = params[:q]
    return @identities = [] if search.blank?

    @identities = Identity.username_similar(search).page(params[:page]).per(8)
  end

  def create
    public_key = Base32.decode(request.headers["Public-Key"])
    @identity = Identity.find_or_initialize_by(public_key: public_key).tap do |id|
      permitted_params = params.require(:identity).permit(:username, :name, avatars: {})
      unless id.persisted?
        id.username = permitted_params[:username]
      end
      id.name = permitted_params[:name]
      id.avatars = permitted_params[:avatars]
      id.server_ip = ip
      id.save!
    end
  end
end
