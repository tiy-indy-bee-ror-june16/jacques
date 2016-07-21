class User < ApplicationRecord
  has_many :notes
  validates :api_token, presence: true, uniqueness: true
  before_validation :generate_api_token, on: :create


private

  def generate_api_token
    if api_token.blank?
      self.api_token = SecureRandom.hex(10) while Author.exists?(api_token: auth_token)
    end
  end
end
