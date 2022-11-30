class CreateShares < ActiveRecord::Migration[7.0]
  def change
    create_table :shares do |t|
      t.float :share_value
      t.integer :share_amount
      t.timestamps
    end
  end
end
