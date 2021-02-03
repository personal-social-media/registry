class ChangeAvatars < ActiveRecord::Migration[6.1]
  def change
    remove_column :identities, :avatar_url
    add_column :identities, :avatars, :text
  end
end
