Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resource :questions, shallow: true
  end
end
