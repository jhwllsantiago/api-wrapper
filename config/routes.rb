Rails.application.routes.draw do
  namespace :api do
    get "/creators", to: "creators#index"
    get "/creators/page/:page", to: "creators#index"
    get "/creators/roles", to: "creators#roles"
    get "/creators/:creator_id", to: "creators#show"

    get "/developers", to: "developers#index"
    get "/developers/page/:page", to: "developers#index"
    get "/developers/:developer_id", to: "developers#show"

    get "/games", to: "games#index"
    get "/games/page/:page", to: "games#index"
    get "/games/top/:timespan", to: "games#index"
    get "/games/top/:timespan/page/:page", to: "games#index"
    get "/games/genres", to: "games#genres"
    get "/games/:game_id", to: "games#show"
    get "/games/:game_id/:sub_directory", to: "games#show_detail"
  end
end
