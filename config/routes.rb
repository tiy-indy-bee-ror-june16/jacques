Rails.application.routes.draw do

  scope :api do
    resources :tags, :notes, :users
  end

  get 'api/notes/tag/:name(.:format)' => 'tags#show'
  post 'api/users/login' => 'users#login'

end
