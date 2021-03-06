# frozen_string_literal: true

# == Schema Information
#
# Table name: identities
#
#  id         :bigint           not null, primary key
#  avatars    :text
#  name       :text             not null
#  public_key :text             not null
#  server_ip  :string           not null
#  signature  :text             default(""), not null
#  username   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_identities_on_name        (name) USING gin
#  index_identities_on_public_key  (public_key)
#  index_identities_on_username    (username) USING gin
#
class Identity < ApplicationRecord
  scope :username_similar, ->(username) do
    quoted_name = ActiveRecord::Base.connection.quote_string(username)
    where("username % ?", username).
      order(Arel.sql("similarity(username, '#{quoted_name}') DESC"))
  end

  serialize :avatars, JSON
  validates :public_key, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true
  validates :server_ip, presence: true

  if Rails.env.production?
    validates :signature, presence: true
    validate :validate_signature
  end

  private
    def validate_signature
      errors.add(:signature, "invalid") unless IdentityService::ValidateSignature.new(self).call!
    end
end
