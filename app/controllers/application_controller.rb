class ApplicationController < ActionController::API
  def bearer_token
    request.headers["Authorization"]&.match(/Bearer\s(.*)/)&.[](1)
  end
end
