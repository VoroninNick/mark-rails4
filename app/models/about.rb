class About < ActiveRecord::Base
  attr_accessible *attribute_names

  acts_as_tree
  has_many :images, :as => :imageable
  attr_accessible :images, :image_ids
  scope :published, -> { where(published: true) }

  protected

  def before_destroy
    if self.id.to_i == 1 #we can't remove this super page
      errors.add_to_base("Саме цю сторінку не можна видалити або зробити невидимою, бо вона є презентабельною в розділі 'Про нас'")
      false
    end
  end

  def before_update
    if (self.id.to_i == 1) && !self.published #we can't remove this super page
      errors.add_to_base("Саме цю сторінку не можна видалити або зробити невидимою, бо вона є презентабельною в розділі 'Про нас'")
      false
    end
  end
end
