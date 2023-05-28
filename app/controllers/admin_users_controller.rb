class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @users = User.all
  end

  private

  def authenticate_admin_user!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
end
