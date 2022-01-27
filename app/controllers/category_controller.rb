class CategoryController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(
    :products,
    :name,
    :uid,
    :description,
    category_products_attributes: [:id, :product_id]
    )
  end
end