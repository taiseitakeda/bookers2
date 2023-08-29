class UsersController < ApplicationController
  
  def index
    @users = User.all
    @bookers = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @bookers = Book.new
  end

  def edit
  end
end
