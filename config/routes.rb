Rails.application.routes.draw do
  resources :points_events
  get 'pages/leaderboard'
  resources :announcements
  get 'announcements/announcements'
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
