class AddSignatureToIdentities < ActiveRecord::Migration[6.1]
  def change
    add_column :identities, :signature, :text, null: false, default: ""
  end
end
