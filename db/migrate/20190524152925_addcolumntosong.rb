class Addcolumntosong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :photo, :string
  end
end
