Rails.application.routes.draw do
  root "home#index"

  resources :departments, only: [:show]

  resources :courses, only: [:show] do
    resource :default_outcomes, only: [:create]
    resources :outcomes
  end

  resources :outcomes do
    resources :assessments
    resources :direct_assessments, only: [:new, :create]
    resources :indirect_assessments
    resources :surveys
    resources :participations
    resources :other_assessments
    resources :outcome_alignments
  end

  resources :direct_assessments, only: [:show, :edit, :update] do
    resources :results, only: [:new, :create]
  end
end
