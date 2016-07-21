class Tag < ApplicationRecord
  has_many :notes, through: :taggings
  has_many :taggings

  validates :name, presence: true

  default_scope { order(created_at: :asc) }

end
