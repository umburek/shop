module Admin

  class UsersController < BaseController
    def index
      @users = User.all
      @user = User.new
    end

    def create
      @user = User.new(user_params)

        if @user.save
          redirect_to admin_users_path, notice: "User registered"
        else

        end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end