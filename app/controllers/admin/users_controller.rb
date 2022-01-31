module Admin
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def create
      @user = User.new(user_params)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end
  end
end