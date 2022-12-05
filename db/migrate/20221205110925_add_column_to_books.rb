class AddColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :current_share_value, :float
    add_column :books, :initial_share_value, :float
  end
end
