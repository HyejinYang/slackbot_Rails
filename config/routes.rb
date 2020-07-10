Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/' => 'home#index'
  get '/' => 'home#index'
  post '/bot' => 'home#bot'
end
