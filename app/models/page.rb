class Page < ActiveRecord::Base
  def self.contacts
    find(1)
  end
end
