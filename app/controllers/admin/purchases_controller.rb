module Admin
  class PurchasesController < ApplicationController

    def index
      @q = Purchase.all.where(status: :open).order(created_at: :desc).ransack(params[:q])
      @purchases_searched = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
      @purchases = @q.result(distinct: true)

      respond_to do |format|
        format.html
        format.csv { send_data @purchases.to_csv, filename: "purchases_#{Date.today}.csv" }
        format.xls
      end
    end
  end
end