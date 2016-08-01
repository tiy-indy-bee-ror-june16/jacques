class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :user

  has_many :tags

  def user
    {username: object.user.username, id: object.user_id}
  end
end
