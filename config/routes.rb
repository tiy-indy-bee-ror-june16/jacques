Rails.application.routes.draw do

  scope :api do
    resources :users
    resources :tags, except: [:show]
    resources :notes
    get 'notes/tag/:name(.:format)' => 'tags#show'
  end


end
