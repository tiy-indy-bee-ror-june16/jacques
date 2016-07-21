class Tag < ApplicationRecord

  default_scope { order(created_at: :asc) }
  validates :name, presence: true

  has_many :taggings
  has_many :notes, through: :taggings

end
