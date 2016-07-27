
class CartsController < ApplicationController

	def add
		@cart.add_item params[:id]
		session["cart"] = @cart.serialize
		product = Product.find params[:id]
		redirect_to :back, notice: "Added #{product.name} to cart"
	end

	def remove
		@cart.remove_item params[:id]
		session["cart"] = @cart.serialize
		product = Product.find params[:id]
		redirect_to :back, notice: "Removed #{product.name} from cart"
	end

	def decrement
		@cart.decrement_quantity params[:id]
		session["cart"] = @cart.serialize
		product = Product.find params[:id]
		redirect_to :back, notice: "Changed quantity of #{product.name}"
	end

	def clear message = true
		session.delete(:cart)
		if message
			redirect_to :back, notice: "cart was cleared."
		end
	end

	def show		
	end

	def checkout
		if current_user
			@order_form = OrderForm.new user: current_user
		else
			@order_form = OrderForm.new user: User.new
		end
	end
end