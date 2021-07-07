class Api::V1::AppsController < ApplicationController
  before_action :authorize_request
  def index; end

  def show
    job_id = params[:id].to_i
    ap = App.new
    applicants = ap.fetch_apps(set_user, job_id)
    return unless applicants

    render json: {
      status: 200,
      message: 'Server returned with 200',
      applicants: applicants
    }
  end

  def create
    ap = App.new(app_params)
    if ap.app_add
      render json: {
        status: 200,
        message: 'You have applied for the role'
      }
    else
      render json: {
        status: 500,
        message: 'This Job may have been removed'
      }
    end
  end

  def update; end

  def destroy; end

  private

  def app_params
    params.require(:app).permit(:user_id, :job_id)
  end
end
