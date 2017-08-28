class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :ended_at
      t.string :location
      t.string :description
      t.integer :extra_life_team_id
      t.string :twitch_stream_url

      t.timestamps
    end
  end
end
