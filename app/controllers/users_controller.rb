class UsersController < ApplicationController

    get "/users" do
        @users = Users.all
        erb :"users/index"
    end

    get "/signup" do
        erb :"users/signup"
    end

    post "/users" do
        @user = Users.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/inventions"
        else
            erb :"users/signup"
        end
    end

end