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
require "rails_helper"

RSpec.describe Identity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
