class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  has_attached_file :avatar, :styles => { :admin_thumb => "100x50#", 
                                          :thumb => "300x122#",
                                          :gallery_thumb => "140x60#",
                                          :big => "620x250#" }
end
