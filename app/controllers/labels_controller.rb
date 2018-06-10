class LabelsController < ApplicationController
  # Vamos rotular?
  def new
    # Pega uma imagem dentro do projeto passado como argumento  
    if (params[:id])
      @project = Project.find(params[:id])
      @image = @project.images.sample
    # Pega uma imagem aleatória
    else 
      count = Image.count
      random_offset = rand(count)
      @image = Image.offset(random_offset).first
    end 
  end
  def create
    
  end
end
