# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Devise::Controllers::Helpers

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

# app/controllers/admin_users_controller.rb
class AdminUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
end
