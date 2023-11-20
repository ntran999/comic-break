class ShowsController < ApplicationController
  def index
    matching_shows = Show.all

    @list_of_shows = matching_shows.order({ :created_at => :desc })

    render({ :template => "shows/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_shows = Show.where({ :id => the_id })

    @the_show = matching_shows.at(0)

    render({ :template => "shows/show" })
  end

  def create
    the_show = Show.new
    the_show.user_id = params.fetch("query_user_id")
    the_show.name = params.fetch("query_name")
    the_show.time = params.fetch("query_time")
    the_show.date = params.fetch("query_date")
    the_show.description = params.fetch("query_description")
    the_show.address = params.fetch("query_address")
    the_show.city = params.fetch("query_city")
    the_show.state = params.fetch("query_state")
    the_show.zip = params.fetch("query_zip")
    the_show.google_api_address = params.fetch("query_google_api_address")
    the_show.show_type_id = params.fetch("query_show_type_id")
    the_show.show_sign_ups_count = params.fetch("query_show_sign_ups_count")

    if the_show.valid?
      the_show.save
      redirect_to("/shows", { :notice => "Show created successfully." })
    else
      redirect_to("/shows", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_show = Show.where({ :id => the_id }).at(0)

    the_show.user_id = params.fetch("query_user_id")
    the_show.name = params.fetch("query_name")
    the_show.time = params.fetch("query_time")
    the_show.date = params.fetch("query_date")
    the_show.description = params.fetch("query_description")
    the_show.address = params.fetch("query_address")
    the_show.city = params.fetch("query_city")
    the_show.state = params.fetch("query_state")
    the_show.zip = params.fetch("query_zip")
    the_show.google_api_address = params.fetch("query_google_api_address")
    the_show.show_type_id = params.fetch("query_show_type_id")
    the_show.show_sign_ups_count = params.fetch("query_show_sign_ups_count")

    if the_show.valid?
      the_show.save
      redirect_to("/shows/#{the_show.id}", { :notice => "Show updated successfully."} )
    else
      redirect_to("/shows/#{the_show.id}", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_show = Show.where({ :id => the_id }).at(0)

    the_show.destroy

    redirect_to("/shows", { :notice => "Show deleted successfully."} )
  end
end
