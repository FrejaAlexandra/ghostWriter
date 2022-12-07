class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cash_wallet
  # monetize :amount_cents

  def show
    @order = current_user.orders.find(params[:id])
  end
end
