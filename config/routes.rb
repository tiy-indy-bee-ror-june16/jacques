Rails.application.routes.draw do

  scope :api do
    resources :users
    resources :tags, except: [:show]
    resources :notes

  end

  get 'tag/:name(.:format)' => 'tags#show'

end
