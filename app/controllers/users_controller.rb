class UsersController < ApplicationController
  # ...

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  @user = User.find(params[:id])
end


  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
