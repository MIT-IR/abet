Rails.application.routes.draw do
  root "home#index"

  resources :departments, only: [:show]

  resources :courses, only: [:show] do
    member do
      get 'adopt_default'
    end

    resources :outcomes
  end

  resources :outcomes do
    resources :assessments
    resources :direct_assessments
    resources :indirect_assessments
    resources :outcome_alignments
  end
end
