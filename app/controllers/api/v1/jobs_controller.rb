class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all

    render json: @jobs
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
