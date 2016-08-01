class Tag < ApplicationRecord

  has_many :taggings
  has_many :notes, through: :taggings

  validates :name, presence: true

  # def to_param
  #   name
  # end
  default_scope { order(name: :asc) }


end
