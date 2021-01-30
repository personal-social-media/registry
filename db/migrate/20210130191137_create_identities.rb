class CreateIdentities < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pg_trgm'

    create_table :identities do |t|
      t.text :username, null: false
      t.text :name, null: false
      t.text :avatar_url
      t.text :public_key, null: false, index: true
      t.string :server_ip, null: false
      t.index :username, opclass: :gin_trgm_ops, using: :gin
      t.index :name, opclass: :gin_trgm_ops, using: :gin

      t.timestamps
    end
  end
end
