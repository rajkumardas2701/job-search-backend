class HomeController < ApplicationController
  def index
    render json: { status: 'It is working' }
  end
end
