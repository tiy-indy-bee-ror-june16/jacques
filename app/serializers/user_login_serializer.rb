class UserLoginSerializer < ActiveModel::Serializer
  attributes :email, :api_token
  has_many :notes
end
