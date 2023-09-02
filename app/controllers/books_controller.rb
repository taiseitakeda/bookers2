class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @books = Book.all
    @bookers =Book.new
  end

  def create
    @bookers = Book.new(book_params)
    @bookers.user_id = current_user.id
    if @bookers.save
      redirect_to book_path(@bookers.id)
      flash[:notice] = "You have created book successfully."
    else
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @bookers = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
end