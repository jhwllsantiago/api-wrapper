class Api::CreatorsController < ApplicationController
  before_action :set_query, only: %i[ index ]
  before_action :set_creator_id, only: %i[ show ]
  
  def index
    render json: Rawg::Client.get("creators", query: @query)
  end

  def roles
    render json: Rawg::Client.get("creator-roles")
  end

  def show
    render json: Rawg::Client.get("creators", @creator_id)
  end

  private
  def set_query
    @query = params.permit(:page).to_h.compact_blank
  end

  def set_creator_id
    @creator_id = params[:creator_id]
  end
end