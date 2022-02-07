module Admin

  class CategoriesController < BaseController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.all.order(name: :asc)
      @category = Category.new
    end

    def show
    end

    def edit
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: "Category added"
      else

      end
    end

    def update
      @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category updated"
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path, notice: "Category deleted"
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end