class AddFeedToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :feed_id, :integer
  end
end
