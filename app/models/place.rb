class Place < ActiveRecord::Base
  belongs_to :product
  belongs_to :schema, :class_name => "::Schema"
end
