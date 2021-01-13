require './config/environment'
class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "hotdog"

  end
  
  helpers do
  end

  def current_user
    @current_user ||= Trainer.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end
end


