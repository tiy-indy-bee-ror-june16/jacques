class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        render json: @user, serializer: UserLoginSerializer
      else
        @error = {error: "Email and/or password does not exist, please try again"}
        render json: @error, status: 403
      end
    else
      @error = {error: "Email and/or password does not exist, please try again"}
      render json: @error, status: 403
    end
  end

end
