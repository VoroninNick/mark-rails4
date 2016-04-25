class DropSubsStiOnGroups < ActiveRecord::Migration
  def self.up
    drop_table :subgroups
    add_column :groups, :parent_id, :integer
    rename_column :products, :subgroup_id, :group_id
  end

  def self.down
  end
end
