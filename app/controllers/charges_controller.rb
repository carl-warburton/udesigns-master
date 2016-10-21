class ChargesController < ApplicationController

  def new
    @cart = Cart.find_by_id(params[:cart])
  end

def create
  # Amount in cents
  @amount = params[:stripeAmount].to_i * 100

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'aud'
  )

  if charge[:paid]
    TransactionMailer.received(current_user.email).deliver_now
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
