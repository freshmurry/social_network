Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "photos#index"
  # Routes for the Follower_request resource:
  # CREATE
  get "/follower_requests/new", :controller => "follower_requests", :action => "new"
  post "/create_follower_request", :controller => "follower_requests", :action => "create"

  # READ
  get "/follower_requests", :controller => "follower_requests", :action => "index"
  get "/follower_requests/:id", :controller => "follower_requests", :action => "show"

  # UPDATE
  get "/follower_requests/:id/edit", :controller => "follower_requests", :action => "edit"
  post "/update_follower_request/:id", :controller => "follower_requests", :action => "update"

  # DELETE
  get "/delete_follower_request/:id", :controller => "follower_requests", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
