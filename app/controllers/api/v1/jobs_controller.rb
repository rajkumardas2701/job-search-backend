class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show update destroy]
  def index
    @jobs = Job.all
    if @jobs
      render json: {
        status: 200,
        jobs: @jobs
      }
    else
      render json: {
        status: 404,
        message: 'No Job to show'
      }
    end
  end

  def show
    render json: @job if @job
  end

  def create; end

  def update; end

  def destroy; end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
