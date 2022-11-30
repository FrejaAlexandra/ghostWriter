class AddForeingKeyToShares < ActiveRecord::Migration[7.0]
  def change
    add_reference :shares, :book, foreign_key: true
  end
end
