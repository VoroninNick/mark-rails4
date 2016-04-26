class Share < ActiveRecord::Base
  attr_accessible *attribute_names

  #cattr_reader :per_page
  #@@per_page = 10
  paginates_per 10

  image :avatar, :styles => { :admin_thumb => "100x50#", :thumb => "300x122#" }
  scope :published, -> { where(published: 't') }
  scope :hot, -> { published.where(hot: 't').order("updated_at DESC") }

  validates_presence_of :name, :brief, :description

  def self.add_hot_to_table
    ActiveRecord::Base.connection.add_column :shares, :hot, :boolean
  end
end
