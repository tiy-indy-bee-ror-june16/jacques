class User < ApplicationRecord

  has_secure_password

  has_many :notes, dependent: :destroy

  validates :api_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true


  before_validation :generate_api_token, on: :create


  def regenerate_api_token
    generate_api_token
  end

  private

  def generate_api_token
    while api_token.blank? || User.exists?(api_token: api_token)
      self.api_token = SecureRandom.hex(10)
    end
  end


end
