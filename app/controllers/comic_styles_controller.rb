class ComicStylesController < ApplicationController
  def index
    matching_comic_styles = ComicStyle.all

    @list_of_comic_styles = matching_comic_styles.order({ :created_at => :desc })

    render({ :template => "comic_styles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comic_styles = ComicStyle.where({ :id => the_id })

    @the_comic_style = matching_comic_styles.at(0)

    render({ :template => "comic_styles/show" })
  end

  def create
    the_comic_style = ComicStyle.new
    the_comic_style.user_id = params.fetch("query_user_id")
    the_comic_style.comedy_style_id = params.fetch("query_comedy_style_id")

    if the_comic_style.valid?
      the_comic_style.save
      redirect_to("/comic_styles", { :notice => "Comic style created successfully." })
    else
      redirect_to("/comic_styles", { :alert => the_comic_style.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comic_style = ComicStyle.where({ :id => the_id }).at(0)

    the_comic_style.user_id = params.fetch("query_user_id")
    the_comic_style.comedy_style_id = params.fetch("query_comedy_style_id")

    if the_comic_style.valid?
      the_comic_style.save
      redirect_to("/comic_styles/#{the_comic_style.id}", { :notice => "Comic style updated successfully."} )
    else
      redirect_to("/comic_styles/#{the_comic_style.id}", { :alert => the_comic_style.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comic_style = ComicStyle.where({ :id => the_id }).at(0)

    the_comic_style.destroy

    redirect_to("/comic_styles", { :notice => "Comic style deleted successfully."} )
  end
end
