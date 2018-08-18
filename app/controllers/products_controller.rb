class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @username = User.find_by params[:user_id]
    @review = Review.new
  end

end
