class ImagesController < ApplicationController
  def new
  end
  
  def create
  end
  
  def show
    @image = Image.find(params[:id])
  end
 
  private def image_params
      params.require(:image).permit(:file)
  end
end
