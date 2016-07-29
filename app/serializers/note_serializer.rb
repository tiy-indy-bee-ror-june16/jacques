class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :user, :created_at, :updated_at,

  def user
    {
      id: object.user_id,
      username: object.user.username,
      email: object.user.email,
      created_at: object.user.created_at
    }
  end

  has_many :tags

end
