class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show update destroy]
  def index
    @jobs = Job.all
    if logged_in?
      if @jobs
        j = Job.new
        filtered = j.get_jobs(set_user)
        render json: {
          status: 200,
          jobs: filtered
        }
      else
        render json: {
          status: 404,
          message: 'No Job to show'
        }
      end
    else
      render json: {
          status: 401,
          errors: ['Unauthorized access']
        }
    end
    
  end

  def show
    if @job
      render json: {
        job: @job,
        status: 200,
        message: 'Job fetched successfully'
      }
    else
      render json: {
        status: 404,
        message: 'Could not find that job'
      }
    end
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
        status: 500
      }
    end
  end

  def update; end

  def destroy
    jb = Job.new
    if jb.remove_apps(@job.id)
      @job.destroy
      render json: {
        status: 200,
        message: 'Job is deleted'
      }
    else
      render json: {
        status: 500,
        message: 'Job couldn\'t be deleted'
      }
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:location, :salary, :role, :skills)
  end
end
