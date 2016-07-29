class User < ApplicationRecord
  has_many :notes
  validates :api_token, presence: true, uniqueness: true
  has_secure_password
  before_validation :generate_api_token, on: :create

  def followers_count
      followers(User).count
  end

  def following_count

  end



private

  def generate_api_token
    while api_token.blank? || User.exists?(api_token: api_token)
      self.api_token = SecureRandom.hex(10)
    end
  end
end
