Rails.application.routes.draw do

scope :api do
  resources :users, :tags, :notes
end

root 'notes#index'
get '/api/notes_count/' => 'notes#count'
post '/api/login' => 'sessions#create'

end
