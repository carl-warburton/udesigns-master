class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_user_profile(user_profile_id)
    current_item = line_items.find_by(user_profile_id: user_profile_id) if current_item
    current_item.quantity += 1 if current_item
  else
    current_item = line_items.build(user_profile_id: user_profile_id)
    current_item
  end

end
