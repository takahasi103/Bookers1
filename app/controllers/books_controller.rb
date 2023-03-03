class BooksController < ApplicationController
  def index
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
  end 

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
