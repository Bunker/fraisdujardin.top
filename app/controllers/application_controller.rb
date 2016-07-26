class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_cart

  def initialize_cart
  	@cart = Cart.build_from_hash session  	
  end

  def authenticate_admin!
  	authenticate_user!

  	unless current_user.admin?
  		redirect_to root_path, alert: "You are not allowed to perform that operation"
  	end
  end
end
