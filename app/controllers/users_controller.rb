class UsersController < ApplicationController
  def index
    matching_users = User.all.where.not(comedian_name: nil)

    @list_of_users = matching_users.order({ :name => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

end
