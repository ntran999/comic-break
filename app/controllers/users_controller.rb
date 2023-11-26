class UsersController < ApplicationController
  def index_comedian
    matching_users = User.all.where.not(comedian_name: nil)

    @list_of_users = matching_users.order({ :name => :asc })

    render({ :template => "users/index_comedian" })
  end

  def show_comedian
    the_name = params.fetch("path_id")

    matching_users = User.where({ :name => the_name })

    @the_user = matching_users.at(0)

    render({ :template => "users/show_comedian" })
  end

  def index_producer
    matching_users = User.all.where.not(producer_name: nil)

    @list_of_users = matching_users.order({ :name => :asc })

    render({ :template => "users/index_producer" })
  end

  def show_producer
    the_name = params.fetch("path_id")

    matching_users = User.where({ :name => the_name })

    @the_user = matching_users.at(0)

    render({ :template => "users/show_producer" })
  end


  def new_profile
    if current_user != nil && (current_user.comedian_name.blank? && current_user.producer_name.blank?)
      the_id = current_user.id
      @the_user = User.where({ :id => the_id }).at(0)
      render({ :template => "users/new_profile" })
      elsif current_user != nil && (current_user.comedian_name.present? || current_user.producer_name.present?)
      redirect_to("/", notice: "You already chose roles. You can edit your role and bio in edit profile.")
      else
      redirect_to("/users/sign_in", notice: "You have to sign in to choose role and edit profile.")
      end
  end

  def save_new_profile
    the_id = current_user.id
    the_user = User.where({ :id => the_id }).at(0)

    the_user.name = params.fetch("query_name")
    the_user.city = params.fetch("query_city")
    the_user.state = params.fetch("query_state")
    if the_user.valid?
      the_user.save
      redirect_to("/users/new_role", { :notice => "Profile updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end


  def new_role
    if current_user != nil && (current_user.comedian_name.blank? && current_user.producer_name.blank?)
    the_id = current_user.id
    @the_user = User.where({ :id => the_id }).at(0)
    render({ :template => "users/new_role" })
    elsif current_user != nil && (current_user.comedian_name.present? || current_user.producer_name.present?)
    redirect_to("/", notice: "You already chose roles. You can edit your role and bio in edit profile.")
    else
    redirect_to("/users/sign_in", notice: "You have to sign in to choose role and edit profile.")
    end
  end

  def update_comedian
    the_id = current_user.id
    @the_user = User.where({ :id => the_id }).at(0)

    the_user.comedian_name = params.fetch("query_comedian_name")
    # the_user.city = params.fetch("query_city")
    # the_user.state = params.fetch("query_state")
    the_user.comedian_bio = params.fetch("query_comedian_bio")
    the_user.short_comedian_bio = params.fetch("query_comedian_short_bio")
    selected_styles = params[:query_comedy_style] || []
      selected_styles.each do |style_id|
        the_comic_style = ComicStyle.new
        the_comic_style.user_id = current_user.id
        the_comic_style.comedy_style_id = style_id
        the_comic_style.save
      end
      
    if the_user.valid?
      the_user.save
      redirect_to("/comedians/#{current_user.id}", { :notice => "Comedian bio updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  def update_producer
    the_id = current_user.id
    @the_user = User.where({ :id => the_id }).at(0)

    the_user.producer_name = params.fetch("query_producer_name")
    # the_user.city = params.fetch("query_city")
    # the_user.state = params.fetch("query_state")
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
    @the_user = User.where({ :id => the_id }).at(0)

    the_user.producer_name = params.fetch("query_producer_name")
    the_user.comedian_name = params.fetch("query_comedian_name")
    # the_user.city = params.fetch("query_city")
    # the_user.state = params.fetch("query_state")
    the_user.comedian_bio = params.fetch("query_comedian_bio")
    the_user.short_comedian_bio = params.fetch("query_comedian_short_bio")
    the_user.producer_bio = params.fetch("query_producer_bio")
    selected_styles = params[:query_comedy_style] || []
      selected_styles.each do |style_id|
        the_comic_style = ComicStyle.new
        the_comic_style.user_id = current_user.id
        the_comic_style.comedy_style_id = style_id
        the_comic_style.save
      end
    if the_user.valid?
      the_user.save
      redirect_to("/comedians/#{current_user.id}", { :notice => "Producer bio updated successfully."} )
    else
      redirect_to("/", { :alert => the_show.errors.full_messages.to_sentence })
    end
  end

  
end
