class CreateSubgroups < ActiveRecord::Migration
  def self.up
    create_table :subgroups do |t|
      t.boolean :published
      t.integer :group_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :subgroups
  end
end
