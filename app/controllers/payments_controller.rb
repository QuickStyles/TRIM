class PaymentsController < ApplicationController
  def new
    @booking = Booking.find params[:booking_id]
  end

  def create
    booking = Booking.find params[:booking_id]

    stripe_customer = Stripe::Customer.create(
      description: "Customer for #{current_user.email}",
      source: params[:stripe_token] # single use token from Stripe.js
    )
    current_user.stripe_customer_id = stripe_customer.id
    current_user.save

    # to charge without creating customers:
    # stripe_charge = Stripe::Charge.create(
    #   amount: (booking.amount * 100).to_i,
    #   currency: "cad",
    #   source: params[:stripe_token],
    #   description: "Payment for booking id #{booking.id}"
    # )

    stripe_charge = Stripe::Charge.create(
      amount: (booking.service.rate * 100).to_i,
      currency: "cad",
      customer: stripe_customer.id,
      description: "Payment for booking id #{booking.id}"
    )
    booking.stripe_txn_id = stripe_charge.id
    booking.save

    redirect_to service_path(booking.service), notice: "Payment completed!"
  end
end
