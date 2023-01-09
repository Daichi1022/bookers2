class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
  end
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
   @user = User.find(params[:id])
   if @user == current_user
     render"edit"
   else
    redirect_to user_path(current_user)
   end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = ""
      redirect_to user_path(@user)
    else
      flash[:notice] = ""
      render "edit"
    end
  end
   
  private
   
  def user_params
     params.require(:user)
     permit(:name,:introduction,:profile_image,)
  
  end

end
