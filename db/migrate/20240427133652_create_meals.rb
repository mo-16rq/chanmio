class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :about
      t.integer :user_id
      t.string :image
      t.string :material

      t.timestamps
    end
  end
end
