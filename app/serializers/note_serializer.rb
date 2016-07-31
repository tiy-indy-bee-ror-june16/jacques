class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :id
  has_many :tags
  belongs_to :user
end
