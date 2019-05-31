class Removedefaultfrominviteduserscolumn < ActiveRecord::Migration[5.2]
  def change
    change_column_default :invited_users, :score, nil
  end
end
