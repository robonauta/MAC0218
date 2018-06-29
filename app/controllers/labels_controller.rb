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
      redirect_to '/' and return if count == 0
      random_offset = rand(count)
      @image = Image.offset(random_offset).first
    end
    
    # Busca uma pergunta e as respostas possíveis pra aquela pergunta
    if (@image)
      @question = Question.where('project_id = ?', @image.project_id).sample
      @answer_opts = AnswerOpt.where('question_id = ?', @question.id)
    end
  end
  
  def create
    # Recebe o id da resposta dada e 
    if (params[:id])
      @answer_opt = AnswerOpt.find(params[:id])
      puts @answer_opt.text
    end
  end
end
