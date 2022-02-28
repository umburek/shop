class PurchasesController < ApplicationController

  def index
    @purchases = current_user.purchases.where(status: :open).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @purchase = current_cart.purchase
    @items = current_cart.purchase.items.where.not(quantity: 0)
    @current_user = current_user
  end

  def create
    @purchase = current_cart.purchase

    if @purchase.update(user_id: current_user.id, status: 'open')
      session[:cart_token] = nil
      redirect_to root_path
    else
      render :new
    end
  end
end