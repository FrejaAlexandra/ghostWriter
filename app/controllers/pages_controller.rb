class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    
  end

  def user_balance
    # balance = params[:balance]
    # current_user.balance += balance
    # raise
    # current_user.save
  end

  def add_user_balance
    balance = params[:balance].to_f
    current_user.balance += balance
    if current_user.save
      redirect_to shares_path
    else
      render "user_balance", status: :unprocessable_entity
    end
  end
end
