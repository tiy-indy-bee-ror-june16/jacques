Rails.application.routes.draw do

scope :api do
  resources :users, :tags, :notes
end

root 'notes#index'
get '/api/notes/tag/(:name)' => 'tags#show'

end
