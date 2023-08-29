class BooksController < ApplicationController
  def index
    @books = Book.all
    @bookers =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    @book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @user = @Book.user
    @bookers = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(user_params)

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
