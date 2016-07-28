class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :address, :city, :postal_code, :country, :phone, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :address, :city, :postal_code, :country, :phone, :password, :password_confirmation, :current_password)
  end


end