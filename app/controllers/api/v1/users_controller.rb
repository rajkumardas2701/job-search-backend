class Api::V1::UsersController < ApplicationController
  before_action :check_user, only: %i[show update destroy]

  def index
    @users = User.all
    if logged_in?
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
    else
      render json: {
        status: 401,
        errors: ['Unauthorized access']
      }
    end
  end

  def show
    if logged_in?
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
    else
      render json: {
        status: 401,
        errors: ['Unauthorized access']
      }
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!
      render json: {
        status: :created,
        user: @user,
        message: ['User is created']
      }
    else
      render json: {
        errors: @user.errors.full_messages,
        status: 500
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
        message: 'Account deletion failed'
      }
    end
  end

  private

  def check_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :user_type)
  end
end
