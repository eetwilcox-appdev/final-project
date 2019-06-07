class WinesController < ApplicationController
  def list
    @wines = Wine.all
    wine_ids = Wine.pluck(:id)
    @my_favorites = Favorite.where({ :wine_id => @wine_ids }).where({ :user_id => current_user.id }).pluck(:wine_id)
    
    @global_wine_rating = Array.new
    wine_ids.each_with_index do |wine_id, index|
      @global_wine_rating[index] = Rating.where({ :wine_id => wine_id }).pluck(:score)
    end
    
    render("wine_templates/list.html.erb")
  end

  def details
    @wine = Wine.where({ :id => params.fetch("id_to_display") }).first
    @global_wine_rating = Rating.where({ :wine_id => @wine.id }).pluck(:score)
    @my_wine_rating = Rating.where({ :user_id => current_user.id }).where({ :wine_id => @wine.id }).pluck(:score)
    @rater_name = Rating.where({ :user_id => current_user.id }).where({ :wine_id => @wine.id }).pluck(:user_id).first

    render("wine_templates/details.html.erb")
  end

  def blank_form
    @wine = Wine.new

    render("wine_templates/blank_form.html.erb")
  end

  def save_new_info
    @wine = Wine.new

    @wine.name = params.fetch("name")
    @wine.varietal = params.fetch("varietal")
    @wine.price = params.fetch("price")
    @wine.location_of_origin = params.fetch("location_of_origin")
    @wine.year_of_origin = params.fetch("year_of_origin")
    @wine.image = params.fetch("image")

    if @wine.valid?
      @wine.save

      redirect_to("/wines", { :notice => "Wine created successfully." })
    else
      render("wine_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @wine = Wine.where({ :id => params.fetch("id_to_prefill") }).first

    render("wine_templates/prefilled_form.html.erb")
  end

  def save_edits
    @wine = Wine.where({ :id => params.fetch("id_to_modify") }).first

    @wine.name = params.fetch("name")
    @wine.varietal = params.fetch("varietal")
    @wine.price = params.fetch("price")
    @wine.location_of_origin = params.fetch("location_of_origin")
    @wine.year_of_origin = params.fetch("year_of_origin")
    @wine.image = params.fetch("image")

    if @wine.valid?
      @wine.save

      redirect_to("/wines/" + @wine.id.to_s, { :notice => "Wine updated successfully." })
    else
      render("wine_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @wine = Wine.where({ :id => params.fetch("id_to_remove") }).first

    @wine.destroy

    redirect_to("/wines", { :notice => "Wine deleted successfully." })
  end
end
