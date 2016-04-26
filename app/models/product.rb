class Product < ActiveRecord::Base
  attr_accessible *attribute_names

  #cattr_reader :per_page
  #@@per_page = 10
  paginates_per 10

  has_many :places
  has_and_belongs_to_many :groups
  has_many :images, :as => :imageable
  attr_accessible :places, :place_ids
  attr_accessible :groups, :group_ids
  attr_accessible :images, :image_ids

  image :avatar, styles: { admin_thumb: "100x50#", thumb: "300x122#" }

  image :logo

  #validates_attachment_presence :logo
  #validates_attachment_content_type :logo, :content_type => 'image/png', :unless => Proc.new { |p| p.logo_file_name.blank? }



  scope :published, -> { where(published: 't') }

  validates_presence_of :name, :brief, :description


end
