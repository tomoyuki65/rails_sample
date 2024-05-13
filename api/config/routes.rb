Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # API用のルーティング設定
  scope "api" do
    scope "v1" do
      get "/hello", to: "application#hello"

      post "/user", to: "users#create"
      get "/user/:uid", to: "users#get_user"
      put "/user/:uid", to: "users#update"
      delete "/user/:uid", to: "users#delete"
      get "/users/with-discarded", to: "users#get_users_with_discarded"
    end
  end
end
