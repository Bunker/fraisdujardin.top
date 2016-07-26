class OrdersController < ApplicationController

	def index
		 @orders = Order.order(created_at: :desc).all
	end

	def create
		@order_form = OrderForm.new(
			user: User.new(order_params[:user]),
			cart: @cart
		)

		if @order_form.save
			notify_user
			notify_admin
			session.delete(:cart)
			redirect_to root_path, notice: "Thank you for your reservation, you'll receive an e-mail confirmation"
		else
			render "carts/checkout"
		end
	end

	def update
		@order = Order.find params[:id]
		@previous_state = @order.state
		if @order.update state_order_params
			notify_user_about_state
			redirect_to orders_path, notice: "Order was updated."
		end
	end

	private

	def notify_user
		@order_form.user.send_reset_password_instructions
		OrderMailer.order_confirmation(@order_form.order).deliver
	end

	def notify_admin
		OrderMailer.order_confirmation_admin(@order_form.order).deliver
	end

	def notify_user_about_state
		OrderMailer.state_changed(@order, @previous_state).deliver
	end

	def order_params
		params.require(:order_form).permit(
			user: [ :name, :phone, :address, :city, :country, :postal_code, :email ]
		)
	end

	def state_order_params
		params.require(:order).permit(:state)
	end
end