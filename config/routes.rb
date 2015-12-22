Rails.application.routes.draw do
  concern :resultable do
    resources :results, only: [:new, :create]
  end

  namespace :manage_assessments do
    root "dashboard#show"

    resources :courses, only: [:index] do
      resources :assessments, only: [:index]
    end

    resources :direct_assessments, only: [:new, :create, :edit, :update] do
      resource :archive, only: [:create, :destroy], type: DirectAssessment
    end

    resources :indirect_assessments, only: [:edit, :update] do
      resource :archive, only: [:create, :destroy], type: IndirectAssessment
    end

    resources :outcomes, only: [] do
      resources :assessments, only: [:new]
      resources :indirect_assessments, only: [:new, :create]
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
    resources :direct_assessments, only: [:show], concerns: :resultable
    resources :indirect_assessments, only: [:show], concerns: :resultable
    resources :results, only: [:edit, :update, :destroy]
    resources :subjects, only: [:index, :show]
  end

  namespace :gradebook do
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
  end

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "manage_outcomes/dashboard#show"
end
