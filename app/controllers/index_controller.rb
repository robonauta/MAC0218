class IndexController < ApplicationController
#    protect_from_forgery unless: -> { request.format.json? }
    def index
        
    end
    
    def new
      
    end
    def create
      render plain: params[:post].inspect
    end
end
