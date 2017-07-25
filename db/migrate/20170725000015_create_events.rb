class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :extra_life_team_id
      t.string :twitch_feed_url

      t.timestamps
    end
  end
end
