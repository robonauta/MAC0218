class PagesController < ApplicationController
    def about
        
    end

    def contact
        
    end
  
    # POST: manda mensagem e redireciona pro root
    def message
        #TODO: post mensagem
        redirect_to '/'
    end
end
