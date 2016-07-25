class LinksController < ApplicationController
  before_action :authorize!
  
  def index
    @links = current_user.links.all
    @link = current_user.links.new
  end 

  def create
    link = current_user.links.new(link_params)

    if link.save 
      flash[:success] = 'Link Created'
    else 
      flash[:error] = 'Link Not Valid'
    end 
    redirect_to links_path
  end 


  private 

    def link_params
      params.require(:link).permit(:url, :title)
    end 

end 