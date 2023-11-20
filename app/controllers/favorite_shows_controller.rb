class FavoriteShowsController < ApplicationController
  def index
    matching_favorite_shows = FavoriteShow.all

    @list_of_favorite_shows = matching_favorite_shows.order({ :created_at => :desc })

    render({ :template => "favorite_shows/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favorite_shows = FavoriteShow.where({ :id => the_id })

    @the_favorite_show = matching_favorite_shows.at(0)

    render({ :template => "favorite_shows/show" })
  end

  def create
    the_favorite_show = FavoriteShow.new
    the_favorite_show.show_id = params.fetch("query_show_id")
    the_favorite_show.user_id = params.fetch("query_user_id")

    if the_favorite_show.valid?
      the_favorite_show.save
      redirect_to("/favorite_shows", { :notice => "Favorite show created successfully." })
    else
      redirect_to("/favorite_shows", { :alert => the_favorite_show.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite_show = FavoriteShow.where({ :id => the_id }).at(0)

    the_favorite_show.show_id = params.fetch("query_show_id")
    the_favorite_show.user_id = params.fetch("query_user_id")

    if the_favorite_show.valid?
      the_favorite_show.save
      redirect_to("/favorite_shows/#{the_favorite_show.id}", { :notice => "Favorite show updated successfully."} )
    else
      redirect_to("/favorite_shows/#{the_favorite_show.id}", { :alert => the_favorite_show.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorite_show = FavoriteShow.where({ :id => the_id }).at(0)

    the_favorite_show.destroy

    redirect_to("/favorite_shows", { :notice => "Favorite show deleted successfully."} )
  end
end
