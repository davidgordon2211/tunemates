class Addcolumntogame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :status, :boolean, default: false
  end
end
