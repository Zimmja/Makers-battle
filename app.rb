require './lib/player'
require './lib/game'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

class Battle < Sinatra::Base

  DEFAULT_HP = 100
  DEFAULT_DAMAGE = 10

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name], DEFAULT_HP)
    $player_2 = Player.new(params[:player_2_name], DEFAULT_HP)
    $game = Game.new
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    erb(:play)
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    $game.attack($player_2, DEFAULT_DAMAGE)
    erb(:attack)
  end

  run! if app_file == $0
end