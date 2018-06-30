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
      if (@question)
        @answer_opts = AnswerOpt.where('question_id = ?', @question.id)
      else 
        redirect_to '/label' and return
      end
    else 
      redirect_to '/label' and return

    end
  end
  def saveanswer
    # Recebe o id da resposta dada e 
    if (params[:aid])
      # atualiza o numero de respostas da opt e salva
      @answer_opt = AnswerOpt.find(params[:aid])
      @question = Question.find(@answer_opt.question.id)
      @answer_opt.nanswers+=1
      @answer_opt.save
      # atualiza o numero de views da questao e salva
      if (@question)
        @question.nviews+=1
        @question.save
      end

      @user = User.find(current_user.id)
      puts @user.name
      if (@user)
        if (!@user.points)
          @user.points = 0
        end
        @user.points+=1
        @user.save
      end
      redirect_to '/label' and return
    else
      redirect_to '/label' and return
    end
  end
end
