module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]

    def index
      @products = Product.all.order(name: :asc, id: :asc)
      render json: @products
    end

    def import
      Product.import(params[:file])
      redirect_to admin_products_path, notice: "Products imported"
    end

    def show
      render json: @product
    end

    def edit
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: "Product added"
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def update
      @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated"
      render json: @product
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path, notice: "Product deleted"
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
end