class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.boolean :published
      t.string :name
      t.text :brief, :description
      t.integer :subgroup_id
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
