class CreateIdentityServices < ActiveRecord::Migration[5.1]
  def change
    create_table :identity_services do |t|
      t.string :provider
      t.string :uid

      t.string :token
      t.string :secret
      t.boolean :expires
      t.datetime :expires_at

      t.string :refresh_token

      t.json :auth

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
