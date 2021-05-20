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

  def create
    @job = Job.new(job_params)
    if @job.save
      jb = Job.new
      jb.add_recruiter_job_to_apps(set_user, @job)
      render json: {
        status: :created,
        job: @job,
        message: 'Job has been added'
      }
    else
      render json: {
        errors: @job.errors.full_messages,
        status: 500,
      }
    end
  end

  def update; end

  def destroy; end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:location, :salary, :role, :skills)
  end
end
