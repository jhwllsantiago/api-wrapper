class Api::CreatorsController < ApplicationController
  def roles
    render json: Rawg::Client.creator_roles
  end
end