class Api::GamesController < ApplicationController
  before_action :set_query, only: %i[ index ]
  before_action :set_game_id, only: %i[ show show_detail ]
  before_action :set_sub_category, only: %i[ show_detail ]

  def index
    render json: Rawg::Client.get("games", query: @query)
  end

  def genres
    render json: Rawg::Client.get("genres")
  end

  def show
    render json: Rawg::Client.get("games", @game_id)
  end

  def show_detail
    render json: Rawg::Client.get("games", @game_id, @sub_directory)
  end

  private
  def set_query
    search_options = { search_precise: true, search_exact: true }
    @query = params.permit(:page, :search, :stores, :developers, :genres, :creators, :dates, :ordering).to_h.compact_blank.merge(search_options)
  end

  def set_game_id
    @game_id = params[:game_id]
  end

  def set_sub_category
    @sub_directory = params[:sub_directory]
  end
end