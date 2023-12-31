class ShowsController < ApplicationController
  def home
  
    @q1 = User.ransack(params[:q])

    @q2 = Show.ransack(params[:q])

    render({ :template => "home_page/home" })
  end

  def index
    
    # @q = Show.ransack(params[:q])
    # @list_of_shows = @q.result.order({ :date => :asc })

    @q2 = Show.ransack(params[:q])
    @list_of_shows = @q2.result.order({ :date => :asc })
    

    # location = params.fetch("show_location", "").strip
    # start_time = params.fetch("start_time", "")
    # end_time = params.fetch("end_time", "")

    # if start_time.empty? && location.empty? && end_time.empty?
    #   matching_shows = Show.all
    #   ##where('date >= ?', Time.now)
    #   @list_of_shows = matching_shows.order({ :date => :asc })

    # elsif location.present? && end_time.empty? && start_time.empty?
    #   matching_shows = Show.where("date >= ?", Time.now).where("city LIKE ? OR state LIKE ?", "%#{location}%", "%#{location}%")
    #   @list_of_shows = matching_shows.order({ :date => :asc })

    # elsif location.present? && end_time.empty? && start_time.present?
    #   matching_shows = Show.where("date >= ? AND (city LIKE ? OR state LIKE ?)", start_time, "%#{location}%", "%#{location}%")
    #   @list_of_shows = matching_shows.order({ :date => :asc })

    # elsif location.present? && end_time.present? && start_time.present?
    #   matching_shows = Show.where("date >= ? AND date < ? AND (city LIKE ? OR state LIKE ?)", start_time, end_time, "%#{location}%", "%#{location}%")
    #   @list_of_shows = matching_shows.order({ :date => :asc })

    # elsif location.empty? && end_time.present? && start_time.present?
    # end
   
    render({ :template => "shows/index" })
  end

    

  def show
    the_id = params.fetch("path_id")

    matching_shows = Show.where({ :id => the_id })

    @the_show = matching_shows.at(0)

    render({ :template => "shows/show" })
  end

  def my_show_index
    @list_of_current_shows = current_user.shows.where("date >= ?", Time.now).order(date: :asc)
    @list_of_archived_shows = current_user.shows.where("date <= ?", Time.now).order(date: :asc)

    @list_of_current_sign_up = current_user.show_sign_ups.includes(:show).where("shows.date >= ?", Time.now).order("shows.date ASC")
    @list_of_archived_sign_up = current_user.show_sign_ups.includes(:show).where("shows.date < ?", Time.now).order("shows.date ASC")

    render({ :template => "shows/my_show_index" })
  end

  def my_bookmark
    @list_of_current_bookmarks = current_user.favorite_shows.includes(:show).where("shows.date >= ?", Time.now).order("shows.date ASC")
    @list_of_archived_bookmarks = current_user.favorite_shows.includes(:show).where("shows.date < ?", Time.now).order("shows.date ASC")
  end

  def create
    the_show = Show.new
    the_show.user_id = current_user.id
    the_show.name = params.fetch("query_name")
    the_show.date = params.fetch("query_date")
    the_show.description = params.fetch("query_description")
    the_show.image = params.fetch("query_image")
    the_show.venue_name = params.fetch("query_venue")
    the_show.address = params.fetch("query_address")
    the_show.city = params.fetch("query_city")
    the_show.state = params.fetch("query_state")
    the_show.zip = params.fetch("query_zip")
    # the_show.google_api_address = params.fetch("query_google_api_address")
    the_show_type = params.fetch("query_show_type_name")
    matching_show_type = ShowType.where({ :name => the_show_type })
    matching_show_type = matching_show_type.at(0)
    the_show.show_type_id = matching_show_type.id
    # the_show.show_sign_ups_count = params.fetch("query_show_sign_ups_count")

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

    # the_show.user_id = current_user.id
    the_show.name = params.fetch("query_name")
    the_show.image = params.fetch("query_image")
    the_show.date = params.fetch("query_date")
    the_show.description = params.fetch("query_description")
    the_show.venue_name = params.fetch("query_venue")
    the_show.address = params.fetch("query_address")
    the_show.city = params.fetch("query_city")
    the_show.state = params.fetch("query_state")
    the_show.zip = params.fetch("query_zip")
    # the_show.google_api_address = params.fetch("query_google_api_address")

    the_show_type = params.fetch("query_show_type_name")
    matching_show_type = ShowType.where({ :name => the_show_type })
    matching_show_type = matching_show_type.at(0)
    the_show.show_type_id = matching_show_type.id

    # the_show.show_sign_ups_count = params.fetch("query_show_sign_ups_count")

    if the_show.valid?
      the_show.save
      redirect_to("/shows/#{the_show.id}", { :notice => "Show updated successfully." })
    else
      redirect_to("/shows/#{the_show.id}", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_show = Show.where({ :id => the_id }).at(0)

    the_show.destroy

    redirect_to("/shows", { :notice => "Show deleted successfully." })
  end
end
