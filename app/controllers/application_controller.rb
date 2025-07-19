class ApplicationController < ActionController::API
  private

  def current_user
    @current_user ||= Users::AuthenticateByTokenService.call(bearer_token)
  end

  def authenticate_user!
    return if current_user

    render json: { message: "Not authorized!" }, status: 401
  end

  def bearer_token
    request.headers["Authorization"]&.match(/Bearer\s(.*)/)&.[](1)
  end
end
