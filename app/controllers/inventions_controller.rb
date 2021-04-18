class InventionsController < ApplicationController

    get "/inventions" do
        if logged_in?
            @invention = Inventions.all
            erb :"inventions/index"
        else
            redirect "/login"
        end
    end
    
    get "inventions/new" do
        if logged_in?
            @invention = Inventions.find_by_id(params[:id])
            erb :"inventions/show"
        else
            redirect "/login"
        end
    end
end