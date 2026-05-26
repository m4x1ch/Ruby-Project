Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    resources :values
    resources :images
    resources :themes
    resources :users

    get "main/index"
    get "main/help"
    get "main/contacts"
    get "main/about"

    root "work#index"

    get "work", to: "work#index"

    namespace :api do
      get "next_image",
        to: "api#next_image"

      get "prev_image",
        to: "api#prev_image"

      post "rate_image",
        to: "api#rate_image"
    end

    get "/signin",
      to: "sessions#new"

    post "/signin",
      to: "sessions#create"

    delete "/signout",
      to: "sessions#destroy"
  end
end
