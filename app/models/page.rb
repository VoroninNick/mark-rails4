class Page < ActiveRecord::Base
  attr_accessible *attribute_names

  def self.contacts
    find(1) rescue nil
  end
end
