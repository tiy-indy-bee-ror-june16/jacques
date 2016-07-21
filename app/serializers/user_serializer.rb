class UserSerializer < ActiveModel::Serializer
  attributes :email, :api_token

  has_many :posts
end
