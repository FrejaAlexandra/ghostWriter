class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @section = params[:section] || 'description'
    @related_books = @book.find_related_tags
    @share = Share.new
    @my_shares = Share.find_by(user_id: current_user.id, book_id: @book.id).share_amount
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
    @book.user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def tagged
    if params[:tag].present?
      @books = Book.tagged_with(params[:tag])
    else
      @books = Book.all
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :psuedoname, :author_description, :description, :value, :shares, :photo, :example, tag_list: [])
  end
end
