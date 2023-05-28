class UsersController < ApplicationController

  def index
    @users = User.includes(:profile).all
  end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user, notice: 'User was successfully updated.'
  else
    render :edit
  end
end

private

def user_params
  params.require(:user).permit(:username, :profile_picture, :password, :password_confirmation)
end

end
