class OrderMailer < ActionMailer::Base

	default from: "filip@fraisdujardin.top"

	def order_confirmation order
		@order = order
		mail to: order.user.email, subject: "Votre reservation (##{order.id})"
	end

	def order_confirmation_admin order
		@order = order
		@admin = User.first.where(:admin => true)
		mail to: @admin.email, subject: "New reservation (##{order.id} by ##{order.user.name}"
	end

	def state_changed order, previous_state
		@order = order
		@previous_state = previous_state

		mail to:order.user.email, subject: "Your order (##{order.id}) has changed!"
	end
end