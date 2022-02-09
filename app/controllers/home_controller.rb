class HomeController < ApplicationController
  def index
    @q = Product.where.not(on_stock: 0).
      and(Product.where.not(price: 0)).
      and(Product.where(archived: false)).
      order(name: :asc).
      ransack(params[:q])
    @products_searched = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    @current_user = current_user
  end
end
