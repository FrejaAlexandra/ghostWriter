class AddForeignKeyUserToShares < ActiveRecord::Migration[7.0]
  def change
    add_reference :shares, :user, foreign_key: true
  end
end
