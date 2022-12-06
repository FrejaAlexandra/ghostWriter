class SharesController < ApplicationController
  def index
    @shares = current_user.shares
  end

  def create
    @book = Book.find(params[:book_id])
    @share = Share.new(share_params)
    @share.share_value = @book.current_share_value
    @share.user = current_user
    @share.book = @book
   
    if params[:buy]
      @book.current_share_value = (1 + @share.share_amount/100) * (@book.current_share_value * rand(1.01...1.05))
    elsif params[:sell]
      @book.current_share_value = (1 + @share.share_amount/100) * (@book.current_share_value * rand(0.95...0.99))
      @share.share_amount = -@share.share_amount
    end
    @book.save
    if @share.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def share_params
    params.require(:share).permit(:share_amount)
  end
end
