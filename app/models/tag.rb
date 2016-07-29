class Tag < ApplicationRecord
  default_scope { order(created_at: :asc) }

  has_many :taggings
  has_many :notes, through: :taggings, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
