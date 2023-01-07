class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

def create
  @book = Book.new(params[:book])
  @book.user_id = curremt_user.id
  if @book.save
      flash[:notice] = "You have created book successfully."
       redirect_to books_path(@book)
  else
      @user = curremt_user
      @books = Book.all
      render :index
  end
end


  def edit
    @book =Book.find(params[:id])
    if @book.user == curremt_user
      render :edit
    else
     redirect_to books_path
    end
    
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = curremt_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to books_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
   @book = Book.find(params[:id])
   if @bbok.destroy
     flash[:notice] = ""
     redirect_to books_path
   end
  end
  
  private
   def book_params
    params.require(:book).permit(:title, :body)
   end

end