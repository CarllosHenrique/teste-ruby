Rails.application.routes.draw do
  get "billings/run_today"
  resources :clients
  resources :invoices, only: %i[index]
  post "billing/run_today", to: "billings#run_today", as: :billing_run_today
  root "clients#index"

  post 'locale/update', to: 'locales#update', as: :update_locale

end
