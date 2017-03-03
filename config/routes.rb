Rails.application.routes.draw do

  root "profile#new"
  resources :profile do
    member do
      get :detect_face
    end
    collection do
      post :profile_attachment
    end
  end
end
