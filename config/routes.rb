Rails.application.routes.draw do

  root "profile#new"
  post '/compare', to: 'profile#compare_face'
  resources :profile do
    collection do
      post :profile_attachment
    end
  end
end
