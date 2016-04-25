class CreateAbouts < ActiveRecord::Migration
  def self.up
    create_table :abouts do |t|
      t.integer :parent_id
      t.boolean :published
      t.string :name
      t.text :description
      t.timestamps
    end
    About.create!(:published => true,
                  :name => "Торговий центр",
                  :description => "Опис")
  end

  def self.down
    drop_table :abouts
  end
end
