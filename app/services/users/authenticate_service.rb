module Users
  class AuthenticateService
    private attr_reader :email, :password

    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      user = User.find_by(email:)
      return false if user.blank?

      if user.password == password
        user
      else
        false
      end
    end
  end
end