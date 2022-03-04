module Admin
  class StatisticsController < ApplicationController

    def index
      @q = Purchase.all.where(status: :open)
                   .order(updated_at: :desc)
                   .ransack(params[:q])
      @q_items = PurchaseItem.all.ransack(params[:q])
      @q_users = User.all.ransack(params[:q])
      @purchases_searched = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
      @items_searched = @q_items.result(distinct: true)
    end
  end
end