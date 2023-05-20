Rails.application.routes.draw do
  
  devise_for :users, path: :gurus, controllers: { sessions: 'users/sessions' },
                                   path_names: { sign_in: :login, sign_out: :quit }

  root  to: "tests#index"

  resources :feedbacks, only: %i[create new]
  
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end

end
