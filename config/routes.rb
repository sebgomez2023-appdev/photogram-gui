Rails.application.routes.draw do

get("/users", {:controller => "users", :action => "index_users"})

get("/users/:unique_name")
end
