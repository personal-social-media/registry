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
require "rails_helper"

RSpec.describe Identity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
