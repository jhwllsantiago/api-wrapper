Rails.application.routes.draw do
  namespace :api do
    get "/creators", to: "creators#index"
    get "/creators/roles", to: "creators#roles"
    get "/creators/:creator_id", to: "creators#show"

    get "/developers", to: "developers#index"
    get "/developers/:developer_id", to: "developers#show"

    get "/games", to: "games#index"
    get "/games/:game_id", to: "games#show"
  end
end
