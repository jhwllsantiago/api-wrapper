class Api::GamesController < ApplicationController
  before_action :set_game_id, only: %i[ show ]

  def index
    render json: Rawg::Client.index("games")
  end

  def show
    render json: Rawg::Client.show("games", @game_id)
  end

  private
  def set_game_id
    @game_id = params[:game_id]
  end
end