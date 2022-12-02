class ChangeSharesFromBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :shares, :total_amount
  end
end
