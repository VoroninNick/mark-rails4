class Schema < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :thumb => "620x>" }

  scope :published, -> { where(published: 't') }
  has_many :places
  has_many :products, :through => :places
  validates_presence_of :name
end
