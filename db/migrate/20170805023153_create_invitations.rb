class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.references :event, foreign_key: true
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
