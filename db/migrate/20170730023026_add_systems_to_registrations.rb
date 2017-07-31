class AddSystemsToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :systems, :json
  end
end
