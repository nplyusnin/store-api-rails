module Users
  class AuthenticateService < ApplicationService
    private attr_reader :email, :password

    option :email
    option :password

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
