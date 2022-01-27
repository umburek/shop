class HomeController < ApplicationController
  def index
    @categories = Category.all
    # @current_user = current_user
  end
end
