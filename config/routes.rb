Rails.application.routes.draw do
  namespace :api do
    resources :subjects, only: [], id: /[A-Z0-9\.]+?/i do
      resources :outcomes, only: [:index]
    end
  end

  namespace :manage_assessments do
    root "dashboard#show"

    resources :courses, only: [:index, :show] do
      resources :outcome_coverages, only: [:new, :create]
      resources :assessments, only: [:index]
    end

    resources :assessments, only: [:new, :create, :edit, :update] do
      resource :archive, only: [:create, :destroy]
    end
  end

  namespace :manage_outcomes do
    resources :courses, only: [] do
      resources :standard_outcomes, only: [:index, :create]
      resources :outcomes, only: [:index, :new, :create]
    end

    resources :outcomes, only: [:edit, :update]
    root "dashboard#show"
  end

  namespace :manage_results do
    resources :assessments, only: [:show] do
      resources :results, only: [:new, :create]
    end

    resources :results, only: [:edit, :update, :destroy]
    resources :subjects, only: [:index, :show]
  end

  namespace :gradebooks do
    get "subjects/:subject_id/gradebook",
      format: :js,
      to: "gradebooks#show",
      as: :gradebook

    get "subjects/:subject_id/:semester/:year/assignments",
      to: "assignments#index",
      as: :assignments

    resources :assignments, only: [] do
      resource :histogram, only: [:show]
    end
  end

  scope :reports, module: :reports do
    resources :courses, only: [] do
      resource :assessment_report, only: [:show]
    end

    root to: "courses#index", as: :reports
  end

  resources :activities, only: [:index]

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "manage_outcomes/dashboard#show"
end
