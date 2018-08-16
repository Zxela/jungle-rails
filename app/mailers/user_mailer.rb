class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = Order.find(order)
    @line_item = @order.line_items.all
    email = @order.email
    @subject = 'Order has been placed. Order ID: ' << @order.id.to_s
    mail(to: email, subject: @subject )
  end
end
