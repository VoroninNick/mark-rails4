class CreateInspirations < ActiveRecord::Migration
  def self.up
    create_table :inspirations do |t|
      t.boolean :published
      t.string :name
      t.text :brief
      t.text :description
      t.string :avatar_file_name, :pdf_file_name
      t.string :avatar_content_type, :pdf_content_type
      t.integer :avatar_file_size, :pdf_file_size
      t.datetime :avatar_updated_at, :pdf_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :inspirations
  end
end
