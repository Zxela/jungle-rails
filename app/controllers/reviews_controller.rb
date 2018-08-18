class ReviewsController < ApplicationController
  before_filter :authorize
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = @current_user
    if @review.save
      # prevent default action of rendering /views/reviews/create.html.erb
      redirect_to @product
    else
      redirect_to @product
    end
  end

  def destroy
    @review = @current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  def average_rating
    @review.ratings.average
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
