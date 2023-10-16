Rails.application.routes.draw do
  #get "/",  controller:  "movies", action: "index" 
  get "/" => "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create"
  get "/movies/new" => "movies#new"
  #post("/movies", { :controller => "movies", :action => "create" })
  #get("/movies/new", { :controller => "movies", :action => "new" })
          
  # READ
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
  #get("/movies", { :controller => "movies", :action => "index" })
  #get("/movies/:id", { :controller => "movies", :action => "show" })
  
  # UPDATE
  patch "/movies" => "movies#update"
  get "/movies" => "movies#edit"
  #patch("/movies/:id", { :controller => "movies", :action => "update" })
  #get("/movies/:id/edit", { :controller => "movies", :action => "edit" })
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"
  #delete("/movies/:id", { :controller => "movies", :action => "destroy" })

  #------------------------------
end
