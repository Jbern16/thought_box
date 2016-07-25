class Api::V1::LinksController < ApiController
  respond_to :json 
  
  def update 
    respond_with Link.update(link_params)
  end 


  private

    def link_params
      params.require(:link).permit(:read, :title, :url) 
    end
end