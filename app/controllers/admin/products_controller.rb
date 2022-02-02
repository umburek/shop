module Admin

  class ProductsController < BaseController
    def index
      @products = Product.all
      @product = Product.new
      @categories = Category.all.order(:name)
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: "Product added"
      else

      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
    end

    private

    def product_params
      params.require(:product).permit(
        :categories,
        :name,
        :description,
        :on_stock,
        category_product_attributes: [:id, :category_id]
      )
    end
  end
end