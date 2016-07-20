class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :api_token
end
