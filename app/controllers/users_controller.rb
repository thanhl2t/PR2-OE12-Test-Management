class UsersController < ApplicationController
  prepend_before_action :current_user, only: :exhibit
  before_action :authenticate_user!, except: [:accept, :exhibit]
  respond_to :html, :xml

  def index
    @users = User.all
  end
  
  def show
    @users = User.find_by_username(params[:id])
  end
end
