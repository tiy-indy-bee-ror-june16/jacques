Rails.application.routes.draw do

  scope :api do
    resources :tags, except: [:show]
    resources :notes
  end

  get 'api/notes/tag/:name(.:format)' => 'tags#show'

end
