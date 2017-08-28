class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.datetime :started_at
      t.datetime :ended_at
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
