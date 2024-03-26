Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/f1_teams", to: "f1_teams#index"
  get "/f1_teams/new", to: "f1_teams#new"
  get "/f1_teams/:id", to: "f1_teams#show"
  #post "/f1_teams", to: "f1_teams#create"
  get "/f1_teams/:id/edit", to: "f1_teams#edit"
  patch "/f1_teams/:id", to: "f1_teams#update"

  get "/f1_drivers", to: "f1_drivers#index" 
  get "/f1_drivers/:id", to: "f1_drivers#show" 
  get "/f1_drivers/:id/edit", to: "f1_drivers#edit"
  patch "/f1_drivers/:id", to: "f1_drivers#update"

  get "/f1_teams/:f1_team_id/f1_drivers", to: "f1_team_drivers#index"
  get "/f1_teams/:f1_team_id/f1_drivers/new", to: "f1_team_drivers#new"
  post "/f1_teams/:f1_team_id/f1_drivers", to: "f1_team_drivers#create"
end
