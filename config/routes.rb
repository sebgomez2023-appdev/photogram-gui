Rails.application.routes.draw do

get("/users", {:controller => "users", :action => "index_users"})
get("/users/:path_username", {:controller => "users", :action => "show_users"})

get("/photos", {:controller => "photos", :action => "index_photos"})
get("/photos/:path_id", {:controller => "photos", :action => "show_photos"})
end
