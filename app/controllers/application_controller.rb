require './config/environment'
class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "hotdog"
  end
  get "/" do
    erb :welcome
  end
  post "/signup" do
    @trainer = Trainer.create(username: params["username"], password_digest: params["password"])
    session[:user_id] = @trainer.id
    redirect '/home'
  end
  # post '/sessions' do
  #   @trainer = Trainer.find_by(username: params[:username], password: params[:password])
  #   if @trainer
  #     session[:id] = @trainer.id
  #     redirect '/home'
  #   end
  #   redirect '/signup'
  #   end
  get '/home' do
    @trainer = Trainer.find_by_id(session[:user_id])
    if logged_in?
    erb :home
    else
      redirect '/'
    end
  end
  helpers do
  def current_user
    @current_user ||= Trainer.find_by_id(session[:user_id])
  end
  def logged_in?
    current_user != nil
  end
end
end