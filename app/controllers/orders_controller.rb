class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    cash_wallet = CashWallet.find(params[:cash_wallet_id])
    order = Order.create!(cash_wallet: cash_wallet, amount_cents: cash_wallet.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          unit_amount: cash_wallet.price_cents,
          currency: 'eur',
          product_data: {
            name: cash_wallet.cash_value
          }
        }
      }],
      mode: "payment",
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

    current_user.update(balance: current_user.balance + (cash_wallet.price_cents / 100))
  end
end
