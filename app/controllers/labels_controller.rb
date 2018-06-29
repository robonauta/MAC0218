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
      # db vazio
      redirect_to '/' and return if count == 0
      random_offset = rand(count)
      @image = Image.offset(random_offset).first
    end
    if (@image)
      @question = Question.where('project_id = ?', @image.project_id).sample
      @answer_opts = AnswerOpt.where('question_id = ?', @question.id)
    end
  end
  
  def create
    
  end
end
