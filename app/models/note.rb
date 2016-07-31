class Note < ApplicationRecord

  belongs_to :user, optional: true
  has_many :tags, through: :taggings
  has_many :taggings

  validates :title, presence: true
  validates :body, presence: true
  # validates :user, presence: true
  default_scope { order(created_at: :asc) }


end
