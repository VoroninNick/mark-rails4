class Article < ActiveRecord::Base
  attr_accessible *attribute_names

  #cattr_reader :per_page
  #@@per_page = 10
  paginates_per 10

  image :avatar, :styles => { :admin_thumb => "100x50#", :thumb => "300x122#" }
  attr_accessible :avatar
  scope :published, -> { where(published: true).order("updated_at DESC") }

  validates_presence_of :name, :brief, :description
end
