Rails.application.routes.draw do
  get 'monthly_figures/index'
  get 'import_responses/create'
  get 'import_responses/destroy'
  root "imports#index"

  resources :imports do
    resources :rawrecruitments
    resources :daily_figures
  end

  resources :result_matrices, only: [:index]
  resources :monthly_figures, only: [:index]
end
