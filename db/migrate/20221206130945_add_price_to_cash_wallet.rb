class AddPriceToCashWallet < ActiveRecord::Migration[7.0]
  def change
    add_monetize :cash_wallets, :price, currency: { present: false }
    change_column :cash_wallets, :cash_value, :string
  end
end
