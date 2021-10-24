Rails.application.routes.draw do
  resources :members
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :events do
    member do
      get :delete
    end
  end
  resources :points_events
  get 'pages/leaderboard'
  resources :announcements
  get 'announcements/announcements'
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
