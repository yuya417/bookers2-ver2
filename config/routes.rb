Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: %i[index show create edit update destroy] do
    resource :favorites, only: %i[create destroy]
    resources :book_comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
