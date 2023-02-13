class UsersController < ApplicationController
  def index_users
    
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index_user.html.erb"})
  end

end
