class AddPositionToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :position, :integer
  end
end
