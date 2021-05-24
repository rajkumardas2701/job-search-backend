class Api::V1::AppsController < ApplicationController
  def index; end

  def show; end

  def create
    ap = App.new
    if ap.app_add(app_params)
      render json: {
        status: 200,
        message: 'You have applied for the role'
      }
    else
      render json: {
        errors: @app.errors.full_messages,
        status: 500,
        message: 'You have already applied for the Job'
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
