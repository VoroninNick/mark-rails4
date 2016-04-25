class AddBriefToArticleAndAction < ActiveRecord::Migration
  def self.up
    add_column :articles, :brief, :text
    add_column :actions, :brief, :text
  end

  def self.down
    remove_column :articles, :brief
    remove_column :actions, :brief
  end
end
