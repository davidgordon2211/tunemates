class AddStatusToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :finished, :boolean, default: false
  end
end
