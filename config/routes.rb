Rails.application.routes.draw do
  root "imports#index"

  resources :imports do
    resources :rawrecruitments
  end
end
