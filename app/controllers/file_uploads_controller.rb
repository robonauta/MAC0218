class FileUploadsController < ApplicationController
  def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(image_params)
  	@image.file.attach(params[:image][:files])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@image = Image.find(params[:image_id])
  	@image.file.(params[:id]).purge
  	redirect_to image_path(@image)
  end

  def show
  	@image = Image.find(params[:image_id])
  end	

  private def image_params
    params.require(:image).permit(:files)
  end

end
