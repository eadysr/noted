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
    @book.user = @user
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
    # Date.strptime(params[:read_date])
    # date_read = params[:book][:read_date]
    # date = Date.strptime(date_read)
    # params[:book][:read_date] = date

    params.require(:book).permit(:title, :description, :read_date)
  end
end
