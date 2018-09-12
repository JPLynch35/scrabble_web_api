Rails.application.routes.draw do
  root "welcome#index"
  post '/words', to: 'words#show'
  
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
