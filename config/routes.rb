Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index_users" })
  get("/users/:path_username", { :controller => "users", :action => "show_users" })
  get("/", { :controller => "users", :action => "home" })
  get("/insert_user_record", { :controller => "users", :action => "create_users" })
  get("/update_user/:modify_user", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index_photos" })
  get("/photos/:path_id", { :controller => "photos", :action => "show_photos" })
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "delete_photos" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
  get("/insert_comment_record/:photo_id", { :controller => "photos", :action => "comment" })
end
