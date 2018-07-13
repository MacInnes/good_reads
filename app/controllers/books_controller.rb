class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @average_rating = @book.average_rating
    @highest_rating = @book.highest_rating
    @lowest_rating = @book.lowest_rating
  end
end
