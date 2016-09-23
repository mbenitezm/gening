Rails.application.routes.draw do
  root 'welcome#index'

  # Routes only without session
  scope constraints: ->(req) { req.session[:user_id].blank? } do
    get 'login', to: 'sessions#new', as: :new_login
    post 'login', to: 'sessions#create', as: :login
    resources :registration, only: [:new, :create]
  end

  # Routes only with session
  scope constraints: ->(req) { !req.session[:user_id].blank? } do
    # For every role
    get 'logout', to: 'sessions#destroy', as: :logout

    # Just if you are an admin
    scope constraints: ->(req) { req.session[:role] == 'admin' } do
      resources :users, only: [:index, :new, :create, :destroy]
    end

    # Just if you are a regular_user
    scope constraints: ->(req) { req.session[:role] == 'regular_user' } do
    end

  end

  # For everyone
  # STATIC PAGES
  get 'contact_us', to: "welcome#contact_us", as: :contact_us
  resources :announcements
end
