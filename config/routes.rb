Rails.application.routes.draw do

  scope :api do
    resources :tags, :users, :notes
  end

end
