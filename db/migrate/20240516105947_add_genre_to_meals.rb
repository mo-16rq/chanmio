class AddGenreToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :genre, :string
  end
end
