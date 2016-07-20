class Note < ApplicationRecord

  belongs_to :author

  has_many :taggings
  has_many :tags, through: :taggings

end
