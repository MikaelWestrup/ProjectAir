Rails.application.routes.draw do
  
  # Admin panel access routes 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root path for application
  root 'home#index'

  # design routes for api with json formate and 'api' namespace
  scope "api", defaults: {format: :json} do
    # design api routes for audits controller all CRUD operation except edit and update
    resources :audits, except: [:edit, :update]
    # design api routes for chapters controller index action and search functionality
    resources :chapters, only: [:index, :create]
    # get specific paragraph details by id
    get 'chapters/paragraph/:id' =>  'chapters#show_paragraph'
    # search content
    get 'chapters' => "chapters#search"
    # list all chapters types
    get 'chapters/list_chapter_type' => "chapters#list_chapter_type"
    # list all companies
    get 'companies' => "employees#conpanies_list"
    # list all departments associated to company
    get 'departments' => "employees#departments_list"
    # list all employees according to comapny and department
    get 'employees' => "employees#employees_list"
    # show employee details
    get 'employees/:id' => "employees#show"
    get 'employees/auditees/:id' => "employees#auditee_employees_list"
    get 'audit-types' => "home#audit_types_list"
    # list all stored location details
    get 'locations' => "home#location_list"
  end
end
