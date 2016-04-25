class Share < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  has_attached_file :avatar, :styles => { :admin_thumb => "100x50#", :thumb => "300x122#" }
  scope :published, -> { where(published: 't') }
  scope :hot, -> { published.where(hot: 't').order("updated_at DESC") }

  validates_presence_of :name, :brief, :description
end
