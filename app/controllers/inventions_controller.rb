class InventionsController < ApplicationController

    get "/inventions" do
        if logged_in?
            @inventions = current_user.inventions
            erb :"inventions/index"
        else
            redirect "/"
        end
    end
    

    get "/inventions/new" do
        if logged_in?
            @inventions = Invention.find_by_id(params[:id])
            erb :"inventions/new"
        else
            redirect "/"
        end
    end

    get "/inventions/:id" do
        if logged_in?
            @invention = current_user.inventions
            erb :"inventions/show"
        else
            redirect "/"
        end
    end

    post "/inventions" do
        invention = Invention.new(params)
        invention.user_id = current_user.id
        if invention.save
            redirect "inventions/#{invention.id}"
        else
            redirect "inventions/new"
        end
    end

    get "/inventions/:id/edit" do
        if logged_in?
            @inventions = Invention.find_by_id(params[:id])
            if @inventions.user_id != current_user.id || @inventions.user_id == nil
                redirect "/inventions"
            else
                erb :"inventions/edit"
            end
        else
            redirect "/"
        end
    end

    patch "/inventions/:id" do
        @inventions= Invention.find_by_id(params[:id])
        if @inventions.user_id != current_user.id
            redirect "inventions"
        end
        params.delete("_method")
        if @inventions.update(params)
            redirect "inventions/#{@inventions.id}"
        else
            redirect "inventions/new"
        end
    end

    delete "/inventions/:id" do
        @invention = Invention.find_by_id(params[:id])
        if @invention.user_id == current_user.id
            @invention.destroy
            redirect "/inventions"
        else
            redirect "/inventions"
        end
    end

    get "/inventions/all" do
        @inventions = Invention.all
        if logged_in?
            @inventions
            erb :"inventions/all"
        else
            redirect "/"
        end
    end
end