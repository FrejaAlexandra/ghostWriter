class BooksController < ApplicationController
  before_action :set_tags, only: [:index, :new, :update]

  def index
    @books = Book.all
    @selected_cats = []
    if params.keys.size > 3
      @selected_cats = params.keys
      filtered_books = []
      @books.each do |book|
        book.tag_list.each do |tag|
          if @selected_cats.include?(tag)
            filtered_books << book unless filtered_books.include?(book)
          end
        end
      end
      @books = filtered_books
    end
  end

  def show
    @book = Book.find(params[:id])
    @section = params[:section] || 'description'
    @related_books = @book.find_related_tags
    @share = Share.new
    @my_shares = Share.where(user_id: current_user.id, book_id: @book.id)
    @share_amount = @my_shares ? @my_shares.map { |share| share.share_amount }.sum() || 0 : 0
    total_shares_distr = Share.where(book_id: @book.id).map { |share| share.share_amount }.sum() || 0
    @total_shares_remain = @book.total_amount - total_shares_distr
    # @share_value = @book.value.to_f / total_shares_remain
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.current_share_value = @book.initial_share_value
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
    @book.current_share_value = @book.initial_share_value
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
    params.require(:book).permit(:title, :psuedoname, :author_description, :description, :initial_share_value, :total_amount, :photo, :example, tag_list: [])
  end

  def set_tags
    @tags = ["Fantasy", "Romance", "Mystery", "Horror", "Thriller", "Paranormal", "Historical Fiction", "Sci-Fi", "Dystopian", "Memoir", "Art", "Self Help", "Motivational", "Health", "History", "Travel Guide", "Cookbook", "Poetry", "Erotic", "Female Author", "Trans Author", "Queer Author", "Non-Binary Author", "POC Author", "Black Author", "Asian Author", "LatinX Author", "Indegenous Author", "Agender Author", "Polysexual Author", "Disabled Author", "Neurodivergent Author", "Literary Prize", "Critically Acclaimed", "Dark", "Cerebral", "Inspiring", "Slow-Burn", "Psychological", "Quirky", "Coming Of Age", "Cultural", "Social Commentary", "Sunday Reading", "Guilty Pleasure", "Strong Female Lead", "Queer Romance" ]
  end
end
