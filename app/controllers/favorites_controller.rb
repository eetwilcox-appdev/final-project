class FavoritesController < ApplicationController
  def list
    @favorites = Favorite.where({ :user_id => current_user.id })
    favorite_wine_ids = Favorite.where({ :user_id => current_user.id }).pluck(:wine_id)
    @fave_wines = current_user.favorite_wines
    
    #for global rating
    @all_rating = Array.new
    favorite_wine_ids.each_with_index do |wine_id, index|
      @all_rating[index] = Rating.where({ :wine_id => wine_id }).pluck(:score)
    end
    
    # for clinks rating  
    @my_clinks = current_user.clinks
    clinks_favorite_wine_ids = Favorite.where({ :user_id => @my_clinks }).pluck(:wine_id)
    
    @my_clinks_score = Array.new
    clinks_favorite_wine_ids.each do |wine_id|
        @my_clinks_ratings = Rating.where({ :wine_id => wine_id}).where({ :user_id => @my_clinks }).pluck(:score)
    end
    
    # for my rating
    @my_rating_score = Rating.where({ :wine_id => favorite_wine_ids }).pluck(:score)

    render("favorite_templates/list.html.erb")
    
  end

  def details
    @favorite = Favorite.where({ :id => params.fetch("id_to_display") }).first
    @favorite_wine_ids = Favorite.where({ :id => params.fetch("id_to_display") }).pluck(:wine_id)
    @fave_wine_score = Rating.where({ :id => @favorite_wine_ids })

    render("favorite_templates/details.html.erb")
  end

  def blank_form
    @favorite = Favorite.new

    render("favorite_templates/blank_form.html.erb")
  end

  def save_new_info
    @favorite = Favorite.new

    @favorite.wine_id = params.fetch("wine_id")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/favorites", { :notice => "Favorite created successfully." })
    else
      render("favorite_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @favorite = Favorite.where({ :id => params.fetch("id_to_prefill") }).first

    render("favorite_templates/prefilled_form.html.erb")
  end

  def save_edits
    @favorite = Favorite.where({ :id => params.fetch("id_to_modify") }).first

    @favorite.wine_id = params.fetch("wine_id")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/favorites/" + @favorite.id.to_s, { :notice => "Favorite updated successfully." })
    else
      render("favorite_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @favorite = Favorite.where({ :id => params.fetch("id_to_remove") }).first

    @favorite.destroy

    redirect_to("/favorites", { :notice => "Favorite deleted successfully." })
  end
end
