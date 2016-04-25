class Partner < ActiveRecord::Base

  has_attached_file :avatar, :styles => {:thumb => "150x92>"}
  validates_presence_of :name, :message => "не може бути пустою"

  scope :publish, -> { where(published: 't').order("created_at DESC") }
  
end