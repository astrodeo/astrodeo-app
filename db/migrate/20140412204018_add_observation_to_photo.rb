class AddObservationToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :observation_id, :integer
  end
end
