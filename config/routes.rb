Rails.application.routes.draw do
  namespace :api do
    get "/creator-roles", to: "creators#roles"
  end
end
