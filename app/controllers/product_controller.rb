class ProductController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit( :name, :uid)
  end
end