class Api::V1::LinksController < ApiController
  respond_to :json
  before_action :find_link 
  
  def update
    url = @link.url
    if @link.update(link_params)
      render json: @link
    else 
      render json: url, status: :unprocessable_entity
    end 
  end 


  private

    def find_link
      @link = Link.find(params[:id])
    end 

    def link_params
      params.require(:link).permit(:read, :title, :url) 
    end
end