class SessionsController < ApplicationController
  before_action :current_session, only: %i(show edit update destroy)

  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find_by params[:id]
    if session.present? :true
      flash[:success]= t ".already"
    else
      flash[:error] = t ".empty"
    end
  end

  def new
    @session = Session.new
  end

  def create
    session = Session.create session_params
    redirect_to sessions_path
  end

  def edit
    @session = Session.find_by params[:id]
  end

  def update
    if
      @session = Session.find(params[:id])
      @session.update(session_params)
      redirect_to session_path(@session)
    else
      flash[:error] = "chua thanh cong"
      render :edit
    end
  end

  def destroy
    @session = Session.find_by params[:id]
    @session.destroy
    redirect_to sessions_path
  end

  private

  def session_params
    params.require(:session).permit :exam_name, :period_for, :supervisor, :create_at, :updated_at
  end

  def current_session
    @session = Session.find_by params[:id]
  end
end
