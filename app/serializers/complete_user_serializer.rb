class CompleteUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :api_token
end
