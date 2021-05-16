class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]
  def index
    @jobs = Job.all
    if @jobs
      render json: {
        status: 200,
        jobs: @jobs,
      }
    else
      render json: {
        status: 404,
        message: 'No Job to show',
      }
    end
  end

  def show
    if @job
      render json: @job
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
