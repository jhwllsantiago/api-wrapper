class Api::CreatorsController < ApplicationController
  before_action :set_creator_id, only: %i[ show ]

  def index
    render json: Rawg::Client.index("creators")
  end

  def roles
    render json: Rawg::Client.index("creator-roles")
  end

  def show
    render json: Rawg::Client.show("creators", @creator_id)
  end

  private
  def set_creator_id
    @creator_id = params[:creator_id]
  end
end