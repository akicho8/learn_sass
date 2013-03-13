require "sinatra/base"
require "sinatra/reloader"
require "sass"
require "haml"
require "compass"
require "animation"

class App < Sinatra::Base
  set :views, Pathname(__FILE__).dirname.join(".").expand_path
  set :public_folder, Pathname(__FILE__).dirname.join(".").expand_path

  configure :development do
    register Sinatra::Reloader
  end

  get "/application.css" do
    sass :application, Compass.sass_engine_options
  end

  get "/" do
    if params[:id]
      haml params[:id].to_sym
    else
      haml :index
    end
  end
end
