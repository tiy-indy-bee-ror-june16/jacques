class User < ApplicationRecord
    has_many :notes

    has_secure_password

    validates :api_token, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    before_validation :generate_api_token, on: :create

    private
    def generate_api_token
      while api_token.blank? || User.exists?(api_token: api_token)
          self.api_token = SecureRandom.hex(10)
      end
    end
end
