Rails.application.routes.draw do
  root 'task#index'

  resources :tasks, except: %i[show]
end
