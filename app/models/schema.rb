class Schema < ActiveRecord::Base
  attr_accessible *attribute_names

  image :avatar, :styles => { :thumb => "620x>" }


  scope :published, -> { where(published: true) }
  has_many :places
  attr_accessible :places, :place_ids
  has_many :products, :through => :places
  attr_accessible :products, :product_ids
  validates_presence_of :name
end
