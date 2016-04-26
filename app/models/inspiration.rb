class Inspiration < ActiveRecord::Base
  attr_accessible *attribute_names

  #cattr_reader :per_page
  #@@per_page = 10
  paginates_per 10

  image :avatar, :styles => { :admin_thumb => "100x50#", :thumb => "300x122#" }
  pdf :pdf





  scope :published, -> { where(published: true) }

  validates_presence_of :name, :brief, :description
  validates_attachment_content_type :pdf, :content_type => 'application/pdf', :message => "має бути формату pdf", :unless => Proc.new { |i| i.pdf_file_name.blank? }


end
