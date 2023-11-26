class UsersController < ApplicationController
  def index
    matching_users = User.all.where.not(comedian_name: nil)

    @list_of_users = matching_users.order({ :name => :desc })

    render({ :template => "users/index" })
  end

  def after_sign_up
    the_id = current_user.id
    @the_user = User.where({ :id => the_id }).at(0)
    render({ :template => "users/after_sign_up" })
  end

  def update_comedian
    the_id = current_user.id
    the_user = User.where({ :id => the_id }).at(0)

    the_user.comedian_name = params.fetch("query_comedian_name")
    the_user.city = params.fetch("query_city")
    the_user.state = params.fetch("query_state")
    the_user.comedian_bio = params.fetch("query_comedian_bio")
    the_user.short_comedian_bio = params.fetch("query_comedian_short_bio")
    if the_user.valid?
      the_user.save
      redirect_to("/", { :notice => "Comedian bio updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def update_producer
    the_id = current_user.id
    the_user = User.where({ :id => the_id }).at(0)

    the_user.producer_name = params.fetch("query_producer_name")
    the_user.city = params.fetch("query_city")
    the_user.state = params.fetch("query_state")
    the_user.producer_bio = params.fetch("query_producer_bio")
    if the_user.valid?
      the_user.save
      redirect_to("/", { :notice => "Producer bio updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end
  
  def update_both
    the_id = current_user.id
    the_user = User.where({ :id => the_id }).at(0)

    the_user.producer_name = params.fetch("query_producer_name")
    the_user.comedian_name = params.fetch("query_comedian_name")
    the_user.city = params.fetch("query_city")
    the_user.state = params.fetch("query_state")
    the_user.comedian_bio = params.fetch("query_comedian_bio")
    the_user.short_comedian_bio = params.fetch("query_comedian_short_bio")
    the_user.producer_bio = params.fetch("query_producer_bio")
    if the_user.valid?
      the_user.save
      redirect_to("/", { :notice => "Producer bio updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

end
