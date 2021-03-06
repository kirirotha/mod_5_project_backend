class SessionsController < ApplicationController

    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        payload = { user_id: @user.id }
        token = JWT.encode(payload,'SUPER_SECRET_KEY','HS256')
        render :json => { auth_key: token, user_id: @user.id, home_latitude: @user.home_latitude, home_longitude: @user.home_longitude}
      else
        render :json => { :msg => "Login failed.. Try again" }
      end
    end
  
  end