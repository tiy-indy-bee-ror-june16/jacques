Rails.application.routes.draw do

  resources :users
  scope :api do
    resources :tags, except: [:show]
    resources :notes
    get 'notes/tag/:name(.:format)' => 'tags#show'
  end


end
