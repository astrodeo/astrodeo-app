class AddObservationToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :observation_id, :integer
  end
end
