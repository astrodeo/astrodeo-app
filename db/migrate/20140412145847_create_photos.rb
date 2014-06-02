class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :path
      t.text :description
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
