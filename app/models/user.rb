class User < ApplicationRecord

  has_secure_password

  has_many :tags
  has_many :posts

  validates :api_token, presence: true, uniqueness: true

  before_validation :generate_auth_token, on: :create


  def regenerate_auth_token
    generate_api_token
  end

  private

  def generate_api_token
    while api_token.blank? || Author.exists?(api_token: api_token)
      self.api_token = SecureRandom.hex(10)
    end
  end


end
