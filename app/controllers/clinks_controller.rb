class ClinksController < ApplicationController
  def list
    @clinks = Clink.all

    render("clink_templates/list.html.erb")
  end

  def show_my_clinks
    @my_clinks = Clink.where({ :sender_id => current_user.id }).all

    render("clink_templates/details.html.erb")
  end

  def blank_form
    @clink = Clink.new

    render("clink_templates/blank_form.html.erb")
  end
  
  def user_profile
    @user = User.where({ :id => params.fetch("id_to_display") }).first
    
    render("users/user_profiles.html.erb")
  end
  
  def user_list
    @users = User.all
    @clinks = Clink.where({ :sender_id => current_user.id })
    
    render("users/user_list.html.erb")
  end
  

  def save_new_info
    @clink = Clink.new

    @clink.sender_id = params.fetch("sender_id")
    @clink.recipient_id = params.fetch("recipient_id")

    if @clink.valid?
      @clink.save

      redirect_to("/users", { :notice => "Clink created successfully." })
    else
      render("clink_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @clink = Clink.where({ :id => params.fetch("id_to_prefill") }).first

    render("clink_templates/prefilled_form.html.erb")
  end

  def save_edits
    @clink = Clink.where({ :id => params.fetch("id_to_modify") }).first

    @clink.sender_id = params.fetch("sender_id")
    @clink.recipient_id = params.fetch("recipient_id")

    if @clink.valid?
      @clink.save

      redirect_to("/clinks/" + @clink.id.to_s, { :notice => "Clink updated successfully." })
    else
      render("clink_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @clink = Clink.where({ :id => params.fetch("id_to_remove") }).first

    @clink.destroy

      redirect_to("/clinks/" + current_user.id.to_s, { :notice => "Clink deleted successfully." })
  end
end
