Rails.application.routes.draw do
  get 'users/new'
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  resources :presentations
  resources :feedbacks
  resources :users, only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]
  end

  # get sessions for signing in, signing up, signing out
  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  # get static pages
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/view_profile', to: 'static_pages#view_profile'
  # get page to create new feedback for specific presentation
  get '/feedbacks/new/:id' => 'feedbacks#new'
  # create feedback for specific presentation
  post '/feedbacks/new/:id' => 'feedbacks#create'
  # view feedback for a specific presentation
  get '/presentations/:id/feedback' => 'presentations#feedback'
  get '/log' => 'log#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
