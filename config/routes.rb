Rails.application.routes.draw do

get("/users", {:controller => "users", :action => "index_users"})

get("/users/:path_username", {:controller => "users", :action => "show_users"})
end
