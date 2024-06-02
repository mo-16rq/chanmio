class AddDetailsToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :overall, :integer
    add_column :meals, :level, :integer　
  end
end
