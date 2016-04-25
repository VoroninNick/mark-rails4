class FixPublishColumns < ActiveRecord::Migration
  def self.up
    rename_column(:articles, :publish, :published)
  end

  def self.down
    rename_column(:articles, :published, :publish)
  end
end
