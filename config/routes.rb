Rails.application.routes.draw do
  
  # Admin panel access routes 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root path for application
  root 'home#index'
end
