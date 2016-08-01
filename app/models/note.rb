class Note < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  attachment :note_image

  validates :title, :body, presence: true


end
