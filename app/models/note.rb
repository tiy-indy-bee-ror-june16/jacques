class Note < ApplicationRecord

  belongs_to :user, optional: true
  has_many :tags, through: :taggings
  has_many :taggings

  validates :title, presence: true, length: {minimum: 1}
  validates :body, presence: true
  # validates :user, presence: true


end
