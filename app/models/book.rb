class Book < ApplicationRecord
  belongs_to :user

  def read(book, string)
    x = Date.strptime(string)
    book.read_date = x
  end
end
