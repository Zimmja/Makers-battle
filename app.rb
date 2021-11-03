require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player1name = params[:player1name]
    @player2name = params[:player2name]
    erb(:play)
  end

  run! if app_file == $0
end