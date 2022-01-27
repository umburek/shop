module Admin
  class AdminPanelController < BaseController
    def index
      @products = Product.all
      @categories = Category.all
    end

    def create
      @product = Product.new(params[:id])
      redirect_to admin_admin_panel_path, notice: "Product Added"
    end

  end
end