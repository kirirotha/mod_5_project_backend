class UsersController < ApplicationController
    before_action :find_user, only:[:show, :update]

    def index
        @users = User.all
        render :json => @users
    end

    def show
        render :json => @user
    end

    def create
        @user = User.create(user_params)
        payload = {user_id: @user.id}
        token = JWT.encode(payload,'SUPER_SECRET_KEY', 'HS256')
        if @user.valid?
        render json: { auth_key: token }, status: :created
        else
        render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
