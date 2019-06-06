class FavoritesController < ApplicationController
  def list
    @favorites = Favorite.where({ :user_id => current_user.id })
    @favorite_wine_ids = Favorite.where({ :user_id => current_user.id }).pluck(:wine_id)
    @fave_wines = Wine.where({ :id => @favorite_wine_ids })
    
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
    @favorite = Favorite.where({ :wine_id => params.fetch("id_to_remove") }).first

    @favorite.destroy

    redirect_to("/favorites", { :notice => "Favorite deleted successfully." })
  end
end
