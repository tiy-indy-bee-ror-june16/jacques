class Note < ApplicationRecord

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  has_many :taggings
  has_many :tags, through: :taggings

end
