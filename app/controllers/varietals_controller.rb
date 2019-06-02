class VarietalsController < ApplicationController
  def list
    @varietals = Varietal.all

    render("varietal_templates/list.html.erb")
  end

  def details
    @varietal = Varietal.where({ :id => params.fetch("id_to_display") }).first

    render("varietal_templates/details.html.erb")
  end

  def blank_form
    @varietal = Varietal.new

    render("varietal_templates/blank_form.html.erb")
  end

  def save_new_info
    @varietal = Varietal.new

    @varietal.grape = params.fetch("grape")
    @varietal.wine_id = params.fetch("wine_id")

    if @varietal.valid?
      @varietal.save

      redirect_to("/varietals", { :notice => "Varietal created successfully." })
    else
      render("varietal_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @varietal = Varietal.where({ :id => params.fetch("id_to_prefill") }).first

    render("varietal_templates/prefilled_form.html.erb")
  end

  def save_edits
    @varietal = Varietal.where({ :id => params.fetch("id_to_modify") }).first

    @varietal.grape = params.fetch("grape")
    @varietal.wine_id = params.fetch("wine_id")

    if @varietal.valid?
      @varietal.save

      redirect_to("/varietals/" + @varietal.id.to_s, { :notice => "Varietal updated successfully." })
    else
      render("varietal_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @varietal = Varietal.where({ :id => params.fetch("id_to_remove") }).first

    @varietal.destroy

    redirect_to("/varietals", { :notice => "Varietal deleted successfully." })
  end
end
