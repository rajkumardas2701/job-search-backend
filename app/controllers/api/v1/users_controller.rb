class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 404,
        errors: ['User not found']
      }
    end
  end

  def show
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 404,
        errors: ['User not found']
      }
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        errors: @user.errors.full_messages,
        status: :unprocessable_entity
      }
    end
  end

  def update
    if @user.update(user_params)
      render json: {
        user: @user,
        status: 200
      }
    else
      render json: {
        errors: @user.errors.full_messages,
        status: :unprocessable_entity
      }
    end
  end

  def destroy
    user = @user
    if @user.destroy
      render json: {
        status: 200,
        message: `#{user.fullname}'s account has been deleted`
      }
    else
      render json: {
        status: 500,
        message: "Account deletion failed"
      }
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :user_type)
  end
end
