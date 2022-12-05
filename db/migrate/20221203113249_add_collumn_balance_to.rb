class AddCollumnBalanceTo < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :balance, :integer
  end
end
