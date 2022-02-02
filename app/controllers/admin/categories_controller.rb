module Admin

  class CategoriesController < BaseController
    def index
      @categories = Category.all
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: "Category added"
      else

      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end