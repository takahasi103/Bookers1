class BooksController < ApplicationController
  
  def index
    @books = Book.all.order(create_at: :asc)
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Successfully Create"
      redirect_to book_path(@book.id)
    else
      @books = Book.all.order(create_at: :asc)
      render :index
    end
  end 
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Successfully Update"
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Successfully Destroy"
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
