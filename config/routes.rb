Rails.application.routes.draw do
  delete 'activities/clear' => 'activities#clear', as: :activity_clear
  get 'activities' => 'activities#index', as: :activities
  get 'departments/*param' => 'departments#categories', as: :department_cat
  get 'login' => 'sessions#new', as: :log_in
  get 'logout' => 'sessions#destroy', as: :log_out
  resources :sessions, :users, :staffs, :departments, :loans, :sabbaticals, :attendances, :preferences, :reliefs
  get 'dashboard/user' => 'dashboard#user', as: :dashboard_user
  get 'dashboard/company' => 'dashboard#company', as: :dashboard_company
  get 'dashboard/preferences' => 'dashboard#preferences', as: :dashboard_setting
  get 'dashboard/records' => 'dashboard#records', as: :dashboard_records
  get 'dashboard' => 'dashboard#index', as: :dashboard
  get 'login' => 'sessions#new'

  root 'sessions#new'
end
