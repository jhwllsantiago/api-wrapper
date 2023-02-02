class Api::CreatorsController < ApplicationController
  before_action :set_creator_id, only: %i[ show ]

  def index
    render json: Rawg::Client.creators
  end

  def roles
    render json: Rawg::Client.creator_roles
  end

  def show
    render json: Rawg::Client.show(@creator_id)
  end

  private
  def set_creator_id
    @creator_id = params[:creator_id]
  end
end