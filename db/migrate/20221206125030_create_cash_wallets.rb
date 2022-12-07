class CreateCashWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_wallets do |t|
      t.float :cash_value

      t.timestamps
    end
  end
end
