class SessionexamsController < ApplicationController
  before_action :current_sessionexam, only: %i(show edit update destroy)
  before_action :author, :only => [:edit, :destroy]

  def index
    @q = Sessionexam.ransack params[:q]
    @sessionexams = @q.result
  end

  def show; end

  def create
    sessionexam = Sessionexam.create sessionexam_params
    redirect_to sessionexams_path
  end

  def new
    @sessionexam = Sessionexam.new
  end

  def edit; end

  def update
    if
      @sessionexam = Sessionexam.find(params[:id])
      @sessionexam.update(sessionexam_params)
      redirect_to sessionexam_path(@sessionexam)
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    @sessionexam.destroy
    redirect_to sessionexams_path
  end

  private

  def sessionexam_params
    params.require(:sessionexam).permit :exam_name, :period_for, :supervisor
  end

  def current_sessionexam
    @sessionexam = Sessionexam.find_by params[:id]
    return if @sessionexam
    flash[:error] = t ".no_sessionexam"
    redirect_to sessionexams_path
  end

  protected

  def author
    @sessionexam = Sessionexam.find_by params[:id]
  end
end
