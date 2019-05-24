class Renamecolumnuseridtohostid < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :user_id, :host_id
  end
end
