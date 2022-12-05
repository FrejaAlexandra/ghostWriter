class ChangeColumnBalanceInUsersToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :balance, :float
  end
end
