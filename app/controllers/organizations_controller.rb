class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
    @resource = @organization
  end
  
  def create
    @organization = Organization.create(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @organization = Organization.find(params['id'])    
  end
  
  def edit
    @organization = Organization.find_by_id(params[:id])
  end
  
  def update
    @organization = Organization.find(params[:id])
    @organization.update_attributes(organization_params)
    respond_to do |format|
      if (@organization.save)
        format.html { redirect_to @organization }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy 
    Organization.find(params[:id]).destroy
    redirect_to organizations_path
  end

  private  
  def organization_params
    params.require(:organization).permit(:name, :address1, :address2, :zip, :city, :email, :tax_id, :site_url, :donation_url, :description)
  end
end