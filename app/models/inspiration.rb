class Inspiration < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  has_attached_file :avatar, :styles => { :admin_thumb => "100x50#", :thumb => "300x122#" }
  has_attached_file :pdf
  scope :published, -> { where(published: 't') }

  validates_presence_of :name, :brief, :description
  validates_attachment_content_type :pdf, :content_type => 'application/pdf', :message => "має бути формату pdf", :unless => Proc.new { |i| i.pdf_file_name.blank? }


end
