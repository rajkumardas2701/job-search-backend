class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: "User logged in successfully", status: 200 }
    else
      render json: { message: "Invalid credentials" }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "User logged out successfully" }
  end
end
