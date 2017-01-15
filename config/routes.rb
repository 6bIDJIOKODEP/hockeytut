Rails.application.routes.draw do
  
  get '/search', to: 'pages#search'

  get '/search_camp', to: 'pages#search_camp'

  resources :contacts, only: [:create]

  get 'pages/about', to: 'contacts#new', as: :about

  resources :forums
  
  resources :forums do
    resources :forum_threads
  end

  resources :forums do
    resources :forum_threads do
      resources :forum_comments, only: [:create, :destroy]
    end
  end

  resources :tournaments

  resources :tournaments do
    resources :reviews, only: [:create, :destroy]
  end
  
  root 'pages#home'

  get 'pages/ads', as: :ads

  get 'pages/close_account', as: :close_account

  get 'pages/my_ads', as: :my_ads

  get 'pages/rules', as: :rules

  get 'pages/terms_of_use', as: :terms

  get 'pages/privacy_policy', as: :privacy

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
              controllers: {registrations: 'registrations'
              }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
