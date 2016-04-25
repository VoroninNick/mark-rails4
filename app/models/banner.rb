class Banner < ActiveRecord::Base

  has_attached_file :avatar, :styles => {:thumb => "680×380>", :admin_thumb => "120x120#"}
  validates_presence_of :name, :message => "не може бути пустою"

  scope :published, -> { where(publish: 't').order("created_at DESC") }

end