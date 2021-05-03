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
            erb :"inventions/new"
        else
            redirect "/"
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

    get "/inventions/:id" do
        if logged_in?
            @invention = current_user.inventions.find_by_id(params[:id])
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
            @invention = Invention.find_by_id(params[:id])
            redirect_if_not_authorized
            erb :"inventions/edit"
        else
            redirect "/"
        end
    end

    patch "/inventions/:id" do
        @invention= Invention.find_by_id(params[:id])
        redirect_if_not_authorized
        params.delete("_method")
        if @invention.update(params)
            redirect "inventions/#{@invention.id}"
        else
            redirect "inventions/new"
        end
    end

    delete "/inventions/:id" do
        @invention = Invention.find_by_id(params[:id])
        redirect_if_not_authorized
        @invention.destroy
        redirect "/inventions"
    end

    private
    def redirect_if_not_authorized
        if @invention == nil || @invention.user_id != current_user.id
            redirect "/inventions"
        end
    end

end