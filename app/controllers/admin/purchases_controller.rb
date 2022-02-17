module Admin
  class PurchasesController < ApplicationController

    def index
      @q = Purchase.all.where(status: :open).order(created_at: :desc).ransack(params[:q])
      @purchases_searched = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
    end
  end
end