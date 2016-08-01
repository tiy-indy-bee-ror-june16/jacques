class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at, :id
  has_many :tags
  belongs_to :user
  has_one :note_image

  def note_image
    Refile.attachment_url(object, :note_image)
  end
end
