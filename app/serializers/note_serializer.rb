class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at
  has_one :photo

  has_many :tags

  def photo
    Refile.attachment_url(object, :photo)
  end
end
