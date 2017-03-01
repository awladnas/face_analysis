Rails.application.routes.draw do

  root "profile#new"
  resources :profile do
    collection do
      post :profile_attachment
    end
  end
end
