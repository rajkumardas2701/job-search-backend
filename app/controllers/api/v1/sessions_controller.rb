class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])
    if login(session_params, 'auth')
      render json: {
        logged_in: true,
        user: @user.attributes.except('password_digest'),
        message: ['User has logged in successfully'],
        token: login(session_params, 'token')
      }
    else
      render json: {
        message: 'Incorrect username/password combination'
      },
             status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
