class InventionsController < ApplicationController

    get "/inventions" do
        if logged_in?
            @invention = Inventions.all
            erb :"inventions/index"
        else
            redirect "/login"
        end
    end    
end