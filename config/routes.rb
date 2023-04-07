Rails.application.routes.draw do
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :quit }

  root  to: "tests#index"

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
