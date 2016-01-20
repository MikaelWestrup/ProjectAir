Rails.application.routes.draw do
  
  # Admin panel access routes 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root path for application
  root 'home#index'

  scope "api", defaults: {format: :json} do
    resources :audits
    resources :chapters, only: [:index, :create]
    get 'chapters/paragraph/:id' =>  'chapters#show_paragraph'
    get 'chapters' => "chapters#search"
    get 'companies' => "employees#conpanies_list"
    get 'departments' => "employees#departments_list"
    get 'employees' => "employees#employees_list"
    get 'employees/auditees/:id' => "employees#auditee_employees_list"
    get 'audit-types' => "home#audit_types_list"
    get 'locations' => "home#location_list"
  end
end
