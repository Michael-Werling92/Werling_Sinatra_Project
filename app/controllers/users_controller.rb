class UsersController < ApplicationController

    get "/users" do
        @users = Users.all
        erb :"users/index"
    end

    get "/signup" do
        erb :"users/signup"
    end
end