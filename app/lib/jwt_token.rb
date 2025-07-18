module JwtToken
  ALGORITHM = "HS256"

  module_function

  def encode(payload)
    JWT.encode(
      payload,
      Rails.application.credentials.secret_key_base, 
      ALGORITHM
    )
  end

  def decode(token)
    JWT.decode(
      token,
      Rails.application.credentials.secret_key_base, 
      true, 
      { algorithm: ALGORITHM }
    )
  end
end
