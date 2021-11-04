require './lib/player'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

class Battle < Sinatra::Base

  DEFAULT_HP = 100
  DEFAULT_DAMAGE = 20
  $player_1 = Player.new('Red')
  $player_2 = Player.new('Blue')

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    session[:player_1_HP] = DEFAULT_HP 
    session[:player_2_HP] = DEFAULT_HP
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    @player_1_HP = DEFAULT_HP
    @player_2_HP = DEFAULT_HP
    erb(:play)
  end

  get '/attack' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    erb(:attack)
  end

  run! if app_file == $0
end