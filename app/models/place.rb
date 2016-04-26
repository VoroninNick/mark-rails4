class Place < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :product
  belongs_to :schema, :class_name => "::Schema"
  attr_accessible :product
  attr_accessible :schema
end
