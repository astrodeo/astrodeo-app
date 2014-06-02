class AddAltitudeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :altitude, :string
  end
end
