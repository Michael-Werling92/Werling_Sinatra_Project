class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        user = Users.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] =user.id
            redirect "/inventions"
        else
            redirect "login"
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end