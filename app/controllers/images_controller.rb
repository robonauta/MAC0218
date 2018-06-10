class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.create!(image_params)
    @image.file.attach(params[:image][:file])
    @image.save!
    redirect_to @image
  end
  
  def show
    @image = Image.find(params[:id])
  end
 
  private def image_params
      params.require(:image).permit(:file)
  end
end
