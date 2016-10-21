class LineItem < ApplicationRecord
  belongs_to :user_profile
  belongs_to :cart
end
