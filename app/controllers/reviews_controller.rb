class ReviewsController < ApplicationController

  # before_action :set_review,

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
   if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new, status: :unprocessable_entity
  end
  end


  # if @review.save
  #   redirect_to restaurant_path(@restaurant)
  # else
  #   render :new, status: :unprocessable_entity
  # end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_review
    @review = Review.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
