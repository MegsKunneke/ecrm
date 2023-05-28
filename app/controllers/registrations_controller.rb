# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

      private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
  
  def create
    super do |user|
      user.role = :sales # Set the default role for new users
      user.save
    end
  end
end
