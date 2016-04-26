class Banner < ActiveRecord::Base
  attr_accessible *attribute_names

  image :avatar, :styles => {:thumb => "680×380>", :admin_thumb => "120x120#"}
  attr_accessible :avatar
  validates_presence_of :name, :message => "не може бути пустою"

  scope :published, -> { where(publish: 't').order("created_at DESC") }


  def self.self_create_table
    ActiveRecord::Base.connection.create_table("banners") {|t| t.attachment :avatar; t.timestamps;t.boolean :publish; t.string :name; t.string :link }
  end
end