class SessionsController < ApplicationController
  def create
    user = Users::AuthenticateByPasswordService.call(email: params[:email], password: params[:password])

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
    Users::RevokeTokenService.call(bearer_token)

    render json: {}, status: :ok
  end
end
