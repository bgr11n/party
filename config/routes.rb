Rails.application.routes.draw do

  # Auth routes
  get 'sign_in', to: 'auth/sign_in#new', as: 'sign_in'
  resource :sign_in, controller: 'auth/sign_in', only: [:create]

  get 'sign_up', to: 'auth/sign_up#new', as: 'sign_up'
  resource :sign_up, controller: 'auth/sign_up', only: [:create]

  get 'sign_out', to: 'auth/sign_in#destroy', as: 'sign_out'
end
