class UsersController < ApplicationController
  def index_users

    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index_user.html.erb"})
  end

  def show_users

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    render({:template => "user_templates/show_user.html.erb"})
  end

end
