Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  # Routes for the User resource:

  # # READ
  get("/comedians", { :controller => "users", :action => "index_comedian" })
  
  get("/comedians/:path_id", { :controller => "users", :action => "show_comedian" })

  get("/producers", { :controller => "users", :action => "index_producer" })
  
  get("/producers/:path_id", { :controller => "users", :action => "show_producer" })

  get("/users/new_profile", { :controller => "users", :action => "new_profile" })

  post("/users/save_new_profile", { :controller => "users", :action => "save_new_profile" })

  get("/users/new_role", { :controller => "users", :action => "new_role" })

  post("/users/comedian_profile", { :controller => "users", :action => "update_comedian" })

  post("/users/producer_profile", { :controller => "users", :action => "update_producer" })

  post("/users/comedian_producer_profile", { :controller => "users", :action => "update_both" })

  # Routes for the Show type resource:

  root "shows#index"

  # # CREATE
  # post("/insert_show_type", { :controller => "show_types", :action => "create" })
          
  # # READ
  # get("/show_types", { :controller => "show_types", :action => "index" })
  
  # get("/show_types/:path_id", { :controller => "show_types", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_show_type/:path_id", { :controller => "show_types", :action => "update" })
  
  # # DELETE
  # get("/delete_show_type/:path_id", { :controller => "show_types", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite show resource:

  # CREATE
  post("/insert_favorite_show", { :controller => "favorite_shows", :action => "create" })
          
  # READ
  get("/favorite_shows", { :controller => "favorite_shows", :action => "index" })
  
  get("/favorite_shows/:path_id", { :controller => "favorite_shows", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite_show/:path_id", { :controller => "favorite_shows", :action => "update" })
  
  # DELETE
  get("/delete_favorite_show/:path_id", { :controller => "favorite_shows", :action => "destroy" })

  #------------------------------

  # Routes for the Comic style resource:

  # # CREATE
  # post("/insert_comic_style", { :controller => "comic_styles", :action => "create" })
          
  # # READ
  # get("/comic_styles", { :controller => "comic_styles", :action => "index" })
  
  # get("/comic_styles/:path_id", { :controller => "comic_styles", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_comic_style/:path_id", { :controller => "comic_styles", :action => "update" })
  
  # # DELETE
  # get("/delete_comic_style/:path_id", { :controller => "comic_styles", :action => "destroy" })

  #------------------------------

  # Routes for the Comedy style resource:

  # # CREATE
  # post("/insert_comedy_style", { :controller => "comedy_styles", :action => "create" })
          
  # # READ
  # get("/comedy_styles", { :controller => "comedy_styles", :action => "index" })
  
  # get("/comedy_styles/:path_id", { :controller => "comedy_styles", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_comedy_style/:path_id", { :controller => "comedy_styles", :action => "update" })
  
  # # DELETE
  # get("/delete_comedy_style/:path_id", { :controller => "comedy_styles", :action => "destroy" })

  #------------------------------

  # Routes for the Show sign up resource:

  # CREATE
  post("/insert_show_sign_up/:path_id", { :controller => "show_sign_ups", :action => "create" })
          
  # READ
  get("/show_sign_ups", { :controller => "show_sign_ups", :action => "index" })
  
  get("/show_sign_ups/:path_id", { :controller => "show_sign_ups", :action => "show" })
  
  # UPDATE
  
  post("/modify_show_sign_up/:path_id", { :controller => "show_sign_ups", :action => "update" })
  
  # DELETE
  post("/delete_show_sign_up/:path_id", { :controller => "show_sign_ups", :action => "destroy" })

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  post("/insert_show", { :controller => "shows", :action => "create" })
          
  # READ
  get("/shows", { :controller => "shows", :action => "index" })
  
  get("/shows/:path_id", { :controller => "shows", :action => "show" })
  
  # UPDATE
  
  post("/modify_show/:path_id", { :controller => "shows", :action => "update" })
  
  # DELETE
  get("/delete_show/:path_id", { :controller => "shows", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
