class Api::DevelopersController < ApplicationController
  before_action :set_developer_id, only: %i[ show ]

  def index
    render json: Rawg::Client.get("developers")
  end

  def show
    render json: Rawg::Client.get("developers", @developer_id)
  end

  private
  def set_developer_id
    @developer_id = params[:developer_id]
  end
end