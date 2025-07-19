class SessionsController < ApplicationController
  def create
    user = Users::AuthenticateService.call(email: params[:email], password: params[:password])

    if user
      render json: {
        access_token: Users::TokenGeneratorService.call(user)
      }, status: :ok
    else
      render json: {
        error: "invalid email or password"
      }, status: :unauthorized
    end
  end

  def destroy
    token = request.headers["Authorization"]&.match(/Bearer\s(.*)/)&.[](1)
    
    Users::RevokeTokenService.call(token)

    render json: {}, status: :ok
  end
end
