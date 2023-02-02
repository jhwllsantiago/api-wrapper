Rails.application.routes.draw do
  namespace :api do
    get "/creators", to: "creators#index"
    get "/creators/roles", to: "creators#roles"
    get "/creators/:creator_id", to: "creators#show"

    get "/developers", to: "developers#index"
    get "/developers/:developer_id", to: "developers#show"
  end
end
