Rails.application.routes.draw do

  scope :api do
    resources :tag, :users, :notes
  end

end
