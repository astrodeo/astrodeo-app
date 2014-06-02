class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.date :seen
      t.string :right_asecnsion
      t.string :declination
      t.string :magnitude
      t.string :catalog_number

      t.timestamps
    end
  end
end
