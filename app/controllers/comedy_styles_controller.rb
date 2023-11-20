class ComedyStylesController < ApplicationController
  def index
    matching_comedy_styles = ComedyStyle.all

    @list_of_comedy_styles = matching_comedy_styles.order({ :created_at => :desc })

    render({ :template => "comedy_styles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comedy_styles = ComedyStyle.where({ :id => the_id })

    @the_comedy_style = matching_comedy_styles.at(0)

    render({ :template => "comedy_styles/show" })
  end

  def create
    the_comedy_style = ComedyStyle.new
    the_comedy_style.comedy_style = params.fetch("query_comedy_style")

    if the_comedy_style.valid?
      the_comedy_style.save
      redirect_to("/comedy_styles", { :notice => "Comedy style created successfully." })
    else
      redirect_to("/comedy_styles", { :alert => the_comedy_style.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comedy_style = ComedyStyle.where({ :id => the_id }).at(0)

    the_comedy_style.comedy_style = params.fetch("query_comedy_style")

    if the_comedy_style.valid?
      the_comedy_style.save
      redirect_to("/comedy_styles/#{the_comedy_style.id}", { :notice => "Comedy style updated successfully."} )
    else
      redirect_to("/comedy_styles/#{the_comedy_style.id}", { :alert => the_comedy_style.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comedy_style = ComedyStyle.where({ :id => the_id }).at(0)

    the_comedy_style.destroy

    redirect_to("/comedy_styles", { :notice => "Comedy style deleted successfully."} )
  end
end
