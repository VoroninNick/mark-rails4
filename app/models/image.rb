class Image < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :imageable, :polymorphic => true
  image :avatar, :styles => { :admin_thumb => "100x50#",
                                          :thumb => "300x122#",
                                          :gallery_thumb => "140x60#",
                                          :big => "620x250#" }

  attr_accessible :imageable

end
