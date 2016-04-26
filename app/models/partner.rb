class Partner < ActiveRecord::Base
  attr_accessible *attribute_names

  image :avatar, :styles => {:thumb => "150x92>"}
  validates_presence_of :name, :message => "не може бути пустою"

  scope :published, -> { where(publish: 't').order("created_at DESC") }

  def self.self_create_table
    ActiveRecord::Base.connection.create_table("partners") {|t| t.attachment :avatar; t.timestamps;t.boolean :publish; t.string :name; t.string :url }
  end
  
end