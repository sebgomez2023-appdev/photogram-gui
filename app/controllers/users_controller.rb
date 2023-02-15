class UsersController < ApplicationController
  def index_users
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    # url_username = params.fetch("input_username")
    # matching_usernames = User.where({ :username => url_username })
    # @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/index_user.html.erb" })
  end

  def show_users
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show_user.html.erb" })
  end

  def home
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/home.html.erb" })
  end

  def create_users
    #insert_user_record input_username

    new_user = User.new

    url_username = params.fetch("input_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    new_user.username = url_username

    new_user.save

    redirect_to("/users/" + new_user.username)

    # render({ :template => "user_templates/create.html.erb"})
  end
end
