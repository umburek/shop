class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :current_cart
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token, user_id: current_user.id)
  end
  helper_method :current_cart

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :first_name, :last_name ])
  end

  private
  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end