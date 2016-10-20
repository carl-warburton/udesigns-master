class AddImagesToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :user_profiles, :images, :json
  end
end
