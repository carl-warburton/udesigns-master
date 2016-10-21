
class UserProfile < ApplicationRecord
  belongs_to :user
  validates_associated :user
  serialize :images, Array
  mount_uploaders :images, ImageUploader

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
