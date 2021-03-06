class ReviewsController < ApplicationController
  def new
    @booking = Booking.find params[:booking_id]
    @review = Review.new
  end

  def create
    @booking = Booking.find params[:booking_id]
    @review = Review.new review_params
    @review.booking = @booking
    @review.customer = current_user.person
    if @review.save
      redirect_to customers_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
