class EngineersController < ApplicationController
  def show
    @engineer = Engineer.find_by(id: params[:id])
  end
end
