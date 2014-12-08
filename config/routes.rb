Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'
  get 'login' => 'welcome#login'
  
  root 'welcome#index'
end
