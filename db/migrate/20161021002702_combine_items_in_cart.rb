class CombineItemsInCart < ActiveRecord::Migration[5.0]

  def change
  end

  def up
    # replace multiple items for a single product in a cart with a # single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:user_profile_id).sum(:quantity)

      sums.each do |user_profile_id, quantity|
         if quantity > 1
           # remove individual items
          cart.line_items.where(user_profile_id: user_profile_id).delete_all
        # replace with a single item
          item = cart.line_items.build(user_profile_id: user_profile_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end


end
