class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.string :address

      t.timestamps
    end
  end
end
