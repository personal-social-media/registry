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
FactoryBot.define do
  factory :identity do
    sequence :name do |n|
      "joe #{n}"
    end

    sequence :username do |n|
      "username-#{n}"
    end

    server_ip { "0.0.0.0" }
    public_key { SecureRandom.hex }
  end
end
