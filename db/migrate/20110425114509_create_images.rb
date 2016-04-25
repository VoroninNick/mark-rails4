class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.references :imageable, :polymorphic => true
      t.string :name, :avatar_file_name, :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
