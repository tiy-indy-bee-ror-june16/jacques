class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id

  belongs_to :user
  has_many :tags

end
