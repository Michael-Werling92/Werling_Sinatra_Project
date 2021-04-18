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

    post "/inventions" do
        invention = Inventions.new(params)
        if invention.save
            redirect "inventions/#{invention.id}"
        else
            redirect "inventions/new"
        end
    end

    get "/inventions/:id/edit" do
        if logged_in?
            @invention = Inventions.find_by_id(params[:id])
            if @invention.user_id != current_user.id || @invention.user_id == nil
                redirect "/inventions"
            else
                erb :"inventions/edit"
            end
        else
            redirect "/login"
        end
    end

end