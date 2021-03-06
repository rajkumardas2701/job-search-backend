class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      login!
      render json: { logged_in: true,
                     user: @user.attributes.except('password_digest'),
                     message: ['User has logged in successfully'] }
    else
      render json: { status: 401,
                     errors: ['Invalid Username or Password'] },
             status: 401
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
