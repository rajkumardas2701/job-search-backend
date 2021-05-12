class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]
  def index
    @jobs = Job.all

    render json: @jobs
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
