class AddPositionToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :position, :integer
  end

  def self.down
    remove_column :groups, :position, :integer
  end
end
