class ShowTypesController < ApplicationController
  def index
    matching_show_types = ShowType.all

    @list_of_show_types = matching_show_types.order({ :created_at => :desc })

    render({ :template => "show_types/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_show_types = ShowType.where({ :id => the_id })

    @the_show_type = matching_show_types.at(0)

    render({ :template => "show_types/show" })
  end

  def create
    the_show_type = ShowType.new
    the_show_type.name = params.fetch("query_name")
    the_show_type.shows_count = params.fetch("query_shows_count")

    if the_show_type.valid?
      the_show_type.save
      redirect_to("/show_types", { :notice => "Show type created successfully." })
    else
      redirect_to("/show_types", { :alert => the_show_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_show_type = ShowType.where({ :id => the_id }).at(0)

    the_show_type.name = params.fetch("query_name")
    the_show_type.shows_count = params.fetch("query_shows_count")

    if the_show_type.valid?
      the_show_type.save
      redirect_to("/show_types/#{the_show_type.id}", { :notice => "Show type updated successfully."} )
    else
      redirect_to("/show_types/#{the_show_type.id}", { :alert => the_show_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_show_type = ShowType.where({ :id => the_id }).at(0)

    the_show_type.destroy

    redirect_to("/show_types", { :notice => "Show type deleted successfully."} )
  end
end
