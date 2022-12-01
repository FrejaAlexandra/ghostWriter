class SharesController < ApplicationController

  def index
    @shares = current_user.shares
  end

  def create
    @share = Share.new(share_params)
    @share.user = current_user
    @book = Book.find(params[:book_id])
    @share.share_value = @book.value
    @share.book = @book

    @book.total_amount = @book.total_amount - @share.share_amount
    @book.save
    if @share.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def calculator
    @share.share_value
  end

  private

  def share_params
    params.require(:share).permit(:share_amount)
  end
end
