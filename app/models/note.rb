class Note < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

end
