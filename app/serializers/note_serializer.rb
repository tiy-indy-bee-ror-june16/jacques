class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at

  has_many :tags
  has_one :user

  has_one :note_image


  def note_image
    Refile.attachment_url(object, :note_image)
  end

end
