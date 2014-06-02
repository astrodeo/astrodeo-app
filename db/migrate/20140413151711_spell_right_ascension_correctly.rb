class SpellRightAscensionCorrectly < ActiveRecord::Migration
  def change
    rename_column :observations, :right_asecnsion, :right_ascension
  end
end
