Rails.application.routes.draw do
  
  # Admin panel access routes 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root path for application
  root 'home#index'

  scope "api", defaults: {format: :json} do
    resources :audits
    resources :chapters, only: :index
    match 'chapters/search' => "chapters#search", via: [:get, :post]
  end
end
