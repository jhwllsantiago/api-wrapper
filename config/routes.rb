Rails.application.routes.draw do
  namespace :api do
    get "/creators", to: "creators#index"
    get "/creators/roles", to: "creators#roles"
    get "/creators/:creator_id", to: "creators#show"
  end
end
