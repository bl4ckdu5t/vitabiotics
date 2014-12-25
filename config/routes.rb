Rails.application.routes.draw do
  get 'department/index'

  get 'sessions/new'

  get 'users/new'
  get 'login' => 'sessions#new', as: :log_in
  get 'logout' => 'sessions#destroy', as: :log_out
  resources :sessions, :users, :staffs, :departments, :loans, :sabbaticals, :attendances
  get 'dashboard/user' => 'dashboard#user', as: :dashboard_user
  get 'dashboard/company' => 'dashboard#company', as: :dashboard_company
  get 'dashboard/preferences' => 'dashboard#preferences', as: :dashboard_setting
  get 'dashboard/office' => 'dashboard#office', as: :dashboard_office
  get 'dashboard' => 'dashboard#index', as: :dashboard
  get 'login' => 'welcome#login'

  root 'sessions#new'
end
