class PurchasesController < ApplicationController

  def new
    @purchase = current_cart.purchase
    @items = current_cart.purchase.items
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