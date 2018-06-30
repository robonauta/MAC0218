class ProjectsController < ApplicationController
  #      render plain: params[:project].inspect
    def index
        @projects = Project.all
        render 'index'
    end
  
    def show
      @project = Project.find(params[:id])
      @show_edit = false;
      if current_user
        if (@project.user_id == current_user.id || current_user.rank == "admin") 
          @show_edit = true;
        end
      end
    end
  
    def new
      if current_user
      else
        redirect_to '/login'
      end
    end
  
    def create
      # Cria um Projeto, altera o seu user_id pro id do usuário e salva na DB.
      # Em caso de sucesso, faz upload das imagens e redireciona pra página de pergunta.
      @project = Project.new(project_params)
      @project.user_id = current_user.id
      if (@project.save)
          params[:project][:files].each { |upload|
            @image = @project.images.create()
            @image.file.attach(upload)
            @image.nviews = 0
            @image.save!
          }
          render 'newquestion' and return
      else
        render 'new'
      end
    end
    
    def create_question
      # Cadastra na DB uma pergunta de um projeto.
      @project = Project.find(params[:question][:project_id])
      @question = Question.new(question_params)
      @question.project_id = @project.id
      @question.nviews = 0
      if (@question.save)
        params[:question][:text].each { |text|
          @answer_opt = AnswerOpt.new()
          @answer_opt.text = text
          @answer_opt.question_id = @question.id
          @answer_opt.nanswers = 0
          @answer_opt.save!
          }
        redirect_to @project and return
      end
    end
  
    def edit
      @project = Project.find(params[:id])
      @project.user_id = current_user.id
    end
  
    def update
      @project = Project.find(params[:id])
      if(@project.update(project_params))
        redirect_to @project
      else
        render 'edit'
      end
    end
  
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end
  
    def dashboard
      @projects = Project.all
      render 'dashboard'
    end

    private def project_params
      params.require(:project).permit(:name, :description)
    end
  
    private def question_params
      params.require(:question).permit(:description, :text, :project_id)
    end
  
    private def image_params
      params.require(:project).permit(:file)
    end

    def dashboard
      @projects = Project.where('user_id = ?', current_user.id)      
    end

    def retrieve
      @images = Image.where('project_id = ?', params[:pid])
      @question = Question.where('project_id', params[:pid]).first
      @opts = AnswerOpt.where('question_id = ?', @question.id)
      render 'retrieve'
    end 
end

