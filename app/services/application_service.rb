class ApplicationService
  class << self
    def call(...)
      new(...).call
    end
  end

  extend Dry::Initializer
end
