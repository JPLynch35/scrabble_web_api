Rails.application.routes.draw do
  root "welcome#index"
  post '/words', to: 'words#show'
end
