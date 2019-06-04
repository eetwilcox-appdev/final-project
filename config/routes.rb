Rails.application.routes.draw do
  
  # Home Page
  match("/", { :controller => "wines", :action => "list", :via => "get" })
  
  # Routes for the Varietal resource:

  # CREATE
  match("/new_varietal_form", { :controller => "varietals", :action => "blank_form", :via => "get" })
  match("/insert_varietal_record", { :controller => "varietals", :action => "save_new_info", :via => "post" })

  # READ
  match("/varietals", { :controller => "varietals", :action => "list", :via => "get" })
  match("/varietals/:id_to_display", { :controller => "varietals", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_varietal_form/:id_to_prefill", { :controller => "varietals", :action => "prefilled_form", :via => "get" })
  match("/update_varietal_record/:id_to_modify", { :controller => "varietals", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_varietal/:id_to_remove", { :controller => "varietals", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Clink resource:

  # CREATE
  match("/new_clink_form", { :controller => "clinks", :action => "blank_form", :via => "get" })
  match("/insert_clink_record", { :controller => "clinks", :action => "save_new_info", :via => "post" })

  # READ
  match("/clinks", { :controller => "clinks", :action => "list", :via => "get" })
  match("/clinks/:id_to_display", { :controller => "clinks", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_clink_form/:id_to_prefill", { :controller => "clinks", :action => "prefilled_form", :via => "get" })
  match("/update_clink_record/:id_to_modify", { :controller => "clinks", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_clink/:id_to_remove", { :controller => "clinks", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Rating resource:

  # CREATE
  match("/new_rating_form", { :controller => "ratings", :action => "blank_form", :via => "get" })
  match("/insert_rating_record", { :controller => "ratings", :action => "save_new_info", :via => "post" })

  # READ
  match("/ratings", { :controller => "ratings", :action => "list", :via => "get" })
  match("/ratings/:id_to_display", { :controller => "ratings", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_rating_form/:id_to_prefill", { :controller => "ratings", :action => "prefilled_form", :via => "get" })
  match("/update_rating_record/:id_to_modify", { :controller => "ratings", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_rating/:id_to_remove", { :controller => "ratings", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  # Routes for the Favorite resource:

  # CREATE
  match("/new_favorite_form", { :controller => "favorites", :action => "blank_form", :via => "get" })
  match("/insert_favorite_record", { :controller => "favorites", :action => "save_new_info", :via => "post" })

  # READ
  match("/favorites", { :controller => "favorites", :action => "list", :via => "get" })
  match("/favorites/:id_to_display", { :controller => "favorites", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_favorite_form/:id_to_prefill", { :controller => "favorites", :action => "prefilled_form", :via => "get" })
  match("/update_favorite_record/:id_to_modify", { :controller => "favorites", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_favorite/:id_to_remove", { :controller => "favorites", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Wine resource:

  # CREATE
  match("/new_wine_form", { :controller => "wines", :action => "blank_form", :via => "get" })
  match("/insert_wine_record", { :controller => "wines", :action => "save_new_info", :via => "post" })

  # READ
  match("/wines", { :controller => "wines", :action => "list", :via => "get" })
  match("/wines/:id_to_display", { :controller => "wines", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_wine_form/:id_to_prefill", { :controller => "wines", :action => "prefilled_form", :via => "get" })
  match("/update_wine_record/:id_to_modify", { :controller => "wines", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_wine/:id_to_remove", { :controller => "wines", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
