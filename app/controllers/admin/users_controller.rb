class UsersController < ApplicationController

    def profile
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    # Additional code for displaying user details
  end

  def index
    @users = User.all
    # Additional code for displaying user list
  end

def new
  if user_signed_in?
    redirect_to users_path, notice: "You are already signed in."
  else
    @user = User.new
  end
end


  def create
    @user = User.new(user_params)
    # Additional code for handling user creation and validation
  end

  def edit
    @user = User.find(params[:id])
    # Additional code for editing user details
  end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "User updated successfully."
    redirect_to users_path
  else
    flash[:error] = "Failed to update user."
    render :edit
  end
end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "User deleted successfully!"
  end

  private



def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
