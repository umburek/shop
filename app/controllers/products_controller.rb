class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :categories,
      :name,
      :description,
      :price,
      :on_stock,
      :photo,
      :archived,
      category_ids: []
    )
  end
end