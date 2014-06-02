class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :description
      t.string :style
      t.string :uri

      t.timestamps
    end
  end
end
