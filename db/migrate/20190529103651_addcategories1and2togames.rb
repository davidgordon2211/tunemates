class Addcategories1and2togames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :category1, index: true, foreign_key: { to_table: :categories }
    add_reference :games, :category2, index: true, foreign_key: { to_table: :categories }

  end
end
