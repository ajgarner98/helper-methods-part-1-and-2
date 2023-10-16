Rails.application.routes.draw do
  #get "/",  controller:  "movies", action: "index" 
  #get "/" => "movies#index"
  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies #movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path
  #post("/movies", { :controller => "movies", :action => "create" })
  #get("/movies/new", { :controller => "movies", :action => "new" })
          
  # READ
  get "/movies" => "movies#index" 
  get "/movies/:id" => "movies#show", as: :movie #movie_path() (expects an argument to populate: idsegment)
  #get("/movies", { :controller => "movies", :action => "index" })
  #get("/movies/:id", { :controller => "movies", :action => "show" })
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path() (expects an argument to populate the id segment)
  #patch("/movies/:id", { :controller => "movies", :action => "update" })
  #get("/movies/:id/edit", { :controller => "movies", :action => "edit" }) 
  
  # DELETE
  delete "/movies/:id" => "movies#destroy" 
  #delete("/movies/:id", { :controller => "movies", :action => "destroy" })

  #------------------------------
end
