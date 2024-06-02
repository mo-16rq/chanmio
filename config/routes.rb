Rails.application.routes.draw do
  devise_for :users
  get 'meals/healthy' => 'meals#healthy'
  get 'meals/standard' => 'meals#standard'
  get 'meals/main' => 'meals#main'
  get 'meals/side' => 'meals#side'
  get 'meals/drink' => 'meals#drink'
  get 'meals/dessert' => 'meals#dessert'
  get 'meals/:meal_id/likes' => 'likes#create'
  get 'meals/:meal_id/likes/:id' => 'likes#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :meals do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    get 'meals/:id' => 'meals#show',as: 'meal'
  end
  root 'meals#index'
end
