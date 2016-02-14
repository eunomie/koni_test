Rails.application.routes.draw do
  resources :moods

  root to: "moods#index"
  get 'details', to: "moods#details"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
