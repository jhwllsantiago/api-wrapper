class Api::GamesController < ApplicationController
  before_action :set_query, only: %i[ index ]
  before_action :set_search_options, only: %i[ index ]
  before_action :set_timespan, only: %i[ index ]
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
    permitted_params = [:page, :timespan, :search, :stores, :developers, :genres, :creators, :dates, :ordering]
    @query = params.permit(permitted_params).to_h.compact_blank
  end

  def set_game_id
    @game_id = params[:game_id]
  end

  def set_sub_category
    @sub_directory = params[:sub_directory]
  end

  def set_search_options
    @query.merge!({ search_precise: true, search_exact: true }) unless params[:search].blank?
  end

  def set_timespan
    timespan = params[:timespan]
    offset = {
      "daily": 1.day.ago.strftime('%Y-%m-%d'),
      "weekly": 1.week.ago.strftime('%Y-%m-%d'),
      "monthly": 1.month.ago.strftime('%Y-%m-%d'),
      "yearly": 1.year.ago.strftime('%Y-%m-%d'),
    }
    if timespan == "all-time" or offset.has_key?(timespan.to_sym)
      @query.merge!(ordering: "-metacritic").except!(:timespan)
    end
    if offset.has_key?(timespan.to_sym)
      @query.merge!(dates: "#{offset[timespan.to_sym]},#{Time.zone.now.strftime('%Y-%m-%d')}")
    end
  end
end