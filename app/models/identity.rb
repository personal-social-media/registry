# frozen_string_literal: true

# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  avatar_url :text
#  name       :text             not null
#  public_key :text             not null
#  server_ip  :string           not null
#  username   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_identities_on_name        (name)
#  index_identities_on_public_key  (public_key)
#  index_identities_on_username    (username)
#
class Identity < ApplicationRecord
  scope :username_similar, ->(username) do
    quoted_name = ActiveRecord::Base.connection.quote_string(username)
    where("username % ?", username).
      order(Arel.sql("similarity(name, '#{quoted_name}') DESC"))
  end
end
