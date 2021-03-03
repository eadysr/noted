class BooksController < ApplicationController
  def index
    @books = Book.where(user_id: current_user.id)
  end

  def show
  end
end
