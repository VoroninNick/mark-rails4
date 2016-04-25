class CreateSchemas < ActiveRecord::Migration
  def self.up
    create_table   :schemas do |t|
      t.boolean    :published, :default => false
      t.string     :name, :avatar_file_name, :avatar_content_type
      t.integer    :avatar_file_size
      t.datetime   :avatar_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :schemas
  end
end
