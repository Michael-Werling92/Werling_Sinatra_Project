class InventionsController < ApplicationController

    get "/inventions" do
        if logged_in?
            @invention = Inventions.all
            erb :"inventions/index"
        else
            redirect "/login"
        end
    end
    
    get "/inventions/new" do
        if logged_in?
            @invention = Inventions.find_by_id(params[:id])
            erb :"inventions/new"
        else
            redirect "/login"
        end
    end

    get "/inventions/:id" do
        if logged_in?
            @invention = Inventions.find_by_id(params[:id])
            erb :"inventions/show"
        else
            redirect "/login"
        end
    end

    post "/inventions"
        invention = Inventions.new(params)
        if invention.save
            redirect "invention/#{invention.id}"
        else
            redirect "invention/new"
        end
    end


end