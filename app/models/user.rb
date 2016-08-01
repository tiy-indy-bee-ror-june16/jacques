class User < ApplicationRecord
  has_many :notes

  acts_as_follower
  acts_as_followable

  has_secure_password

  validates :auth_token, presence: true, uniqueness: true

  before_validation :generate_auth_token, on: :create

  def followers_count
    followers(User).count
  end

  def following_count
  end

  def timeline_tweets
    Tweet.timeline(self)
  end

  private

  def generate_auth_token
    while auth_token.blank? || User.exists?(auth_token: auth_token)
      Rails.logger.info "Hey"
      self.auth_token = SecureRandom.hex(10)
    end
    Rails.logger.info auth_token
  end

end
