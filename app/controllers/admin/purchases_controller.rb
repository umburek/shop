module Admin
  class PurchasesController < ApplicationController

    def index
      @q = Purchase.all.order(created_at: :desc).ransack(params[:q])
      @purchases_searched = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
      @purchase_items = PurchaseItem.all
    end
  end
end