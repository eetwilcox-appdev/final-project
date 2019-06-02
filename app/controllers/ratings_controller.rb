class RatingsController < ApplicationController
  def list
    @ratings = Rating.all

    render("rating_templates/list.html.erb")
  end

  def details
    @rating = Rating.where({ :id => params.fetch("id_to_display") }).first

    render("rating_templates/details.html.erb")
  end

  def blank_form
    @rating = Rating.new

    render("rating_templates/blank_form.html.erb")
  end

  def save_new_info
    @rating = Rating.new

    @rating.wine_id = params.fetch("wine_id")
    @rating.user_id = params.fetch("user_id")
    @rating.score = params.fetch("score")
    @rating.comment = params.fetch("comment")

    if @rating.valid?
      @rating.save

      redirect_to("/ratings", { :notice => "Rating created successfully." })
    else
      render("rating_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @rating = Rating.where({ :id => params.fetch("id_to_prefill") }).first

    render("rating_templates/prefilled_form.html.erb")
  end

  def save_edits
    @rating = Rating.where({ :id => params.fetch("id_to_modify") }).first

    @rating.wine_id = params.fetch("wine_id")
    @rating.user_id = params.fetch("user_id")
    @rating.score = params.fetch("score")
    @rating.comment = params.fetch("comment")

    if @rating.valid?
      @rating.save

      redirect_to("/ratings/" + @rating.id.to_s, { :notice => "Rating updated successfully." })
    else
      render("rating_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @rating = Rating.where({ :id => params.fetch("id_to_remove") }).first

    @rating.destroy

    redirect_to("/ratings", { :notice => "Rating deleted successfully." })
  end
end
