class BooksController < ApplicationController
  def index
    @books = Book.where(user_id: current_user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.new
  end

  def create
    @user = current_user

    @book = Book.new(book_params)
    if @book.save
      redirect_to user_books_path(current_user)
    else
      raise
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_books_path(current_user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :user_id)
  end

  def date_params
    year = params[:book]['read_date(1i)'].to_i,
    month = params[:book]['read_date(2i)'].to_i,
    day = params[:book]['read_date(3i)'].to_i
    read_date = day -- month -- year
  end
end
