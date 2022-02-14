class PurchasesController < ApplicationController

  def new
    @purchase = current_cart.purchase
    @items = current_cart.purchase.items
    @current_user = current_user
  end

  def create
    @purchase = current_cart.purchase

    if @purchase.update_attributes(purchase_params.merge(status: 'open'))
      session[:cart_token] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:first_name, :last_name)
  end
end