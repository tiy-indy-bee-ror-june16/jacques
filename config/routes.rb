Rails.application.routes.draw do

  scope :api do
    resources :users
    resources :tags
    resources :notes

  end

end
