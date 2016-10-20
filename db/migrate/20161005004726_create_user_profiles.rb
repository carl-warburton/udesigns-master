class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.integer :age
      t.string :hometown
      t.string :instagram
      t.string :portfolio

      t.timestamps
    end
  end
end
