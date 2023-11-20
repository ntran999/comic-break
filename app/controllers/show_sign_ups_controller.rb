class ShowSignUpsController < ApplicationController
  def index
    matching_show_sign_ups = ShowSignUp.all

    @list_of_show_sign_ups = matching_show_sign_ups.order({ :created_at => :desc })

    render({ :template => "show_sign_ups/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_show_sign_ups = ShowSignUp.where({ :id => the_id })

    @the_show_sign_up = matching_show_sign_ups.at(0)

    render({ :template => "show_sign_ups/show" })
  end

  def create
    the_show_sign_up = ShowSignUp.new
    the_show_sign_up.user_id = params.fetch("query_user_id")
    the_show_sign_up.show_id = params.fetch("query_show_id")

    if the_show_sign_up.valid?
      the_show_sign_up.save
      redirect_to("/show_sign_ups", { :notice => "Show sign up created successfully." })
    else
      redirect_to("/show_sign_ups", { :alert => the_show_sign_up.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_show_sign_up = ShowSignUp.where({ :id => the_id }).at(0)

    the_show_sign_up.user_id = params.fetch("query_user_id")
    the_show_sign_up.show_id = params.fetch("query_show_id")

    if the_show_sign_up.valid?
      the_show_sign_up.save
      redirect_to("/show_sign_ups/#{the_show_sign_up.id}", { :notice => "Show sign up updated successfully."} )
    else
      redirect_to("/show_sign_ups/#{the_show_sign_up.id}", { :alert => the_show_sign_up.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_show_sign_up = ShowSignUp.where({ :id => the_id }).at(0)

    the_show_sign_up.destroy

    redirect_to("/show_sign_ups", { :notice => "Show sign up deleted successfully."} )
  end
end
