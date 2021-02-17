Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'audio' => 'audio#show'
    end
  end
end
