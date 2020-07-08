class HomeController < ApplicationController
    def index
        if params.has_key?(:challenge)
            render json: params[:challenge]
        end
        puts response.body
        request 
    end
end
