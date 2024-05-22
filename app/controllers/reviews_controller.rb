class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@review.restaurant)
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy # @review is gone from the DB but still available in code

    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
