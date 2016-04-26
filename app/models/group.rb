class Group < ActiveRecord::Base
  attr_accessible *attribute_names

  acts_as_tree :order => "position"
  has_and_belongs_to_many :products
  attr_accessible :products, :product_ids

  scope :published, -> { where(published: true) }

  validates_presence_of :name
  validates_uniqueness_of :name
  validate :escape_parent_loop
  validate :two_level_nesting

  def root?
    self.parent ? false : true
  end

  private
  
  def escape_parent_loop
    errors.add(:parent_id, "не може містити себе як підгрупу") if !self.parent_id.blank? && (self.id == self.parent_id)
  end

  def two_level_nesting
    errors.add(:parent_id, "данний каталог є двох рівневим, оберіть іншу позицію в 'Належить до'") if self.parent && !self.parent.root?
  end


end
