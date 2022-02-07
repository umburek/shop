module Admin
  class ProductsController < BaseController
    before_action :set_product, only: %i[ show edit update destroy ]

    def index
      @products = Product.all.order(name: :asc)
      @product = Product.new
    end

    def show
    end

    def edit
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: "Product added"
      else

      end
    end

    def update
      @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated"
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
        :on_stock,
        :photo,
        :archived,
        category_ids: []
      )
    end
  end
end