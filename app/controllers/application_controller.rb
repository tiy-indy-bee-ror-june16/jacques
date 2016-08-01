class ApplicationController < ActionController::API

  def current_user
    if params[:api_token] && User.exists?(api_token: params[:api_token])
      @user ||= User.find_by(api_token: params[:api_token])
    end
    @user
  end

  def require_user
    render json: {error: "You need to be logged in to do that"}, status: :forbidden unless current_user
  end
end
