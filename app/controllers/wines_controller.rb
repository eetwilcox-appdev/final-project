class WinesController < ApplicationController
  def list
    @wines = Wine.all

    render("wine_templates/list.html.erb")
  end

  def details
    @wine = Wine.where({ :id => params.fetch("id_to_display") }).first

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