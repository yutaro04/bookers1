class BooksController < ApplicationController
  def top
  end

  def index
	@newbook = Book.new
	@books = Book.all
  end

  def create
  	newbook = Book.new(book_params)
  	# newbook.save
  	# redirect_to book_path(newbook.id)
  	if newbook.save
      flash[:notice] = "successfully"
      redirect_to book_path(newbook.id)
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def update
  	newbook = Book.find(params[:id])
    # newbook.update(book_params)
    # redirect_to book_path(newbook.id)
    if newbook.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(newbook.id)
    end
  end

  def edit
  	@newbook = Book.find(params[:id])
  end

  def destroy
     newbook = Book.find(params[:id])
     newbook.destroy
     redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
