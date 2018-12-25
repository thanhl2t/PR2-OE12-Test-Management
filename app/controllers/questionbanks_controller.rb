class QuestionbanksController < ApplicationController
  before_action :current_questionbank, only: %i(show edit update destroy)
  before_action :author, :only => [:edit, :destroy]

  def index
    @q = Questionbank.ransack params[:q]
    @questionbanks = @q.result
  end

  def show; end

  def create
    questionbank = Questionbank.create questionbank_params
    redirect_to questionbanks_path
  end

  def new
    @questionbank = Questionbank.new
  end

  def edit; end

  def update
    if
      @questionbank = Questionbank.find(params[:id])
      @questionbank.update(questionbank_params)
      redirect_to questionbank_path(@questionbank)
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    @questionbank.destroy
    redirect_to questionbanks_path
  end

  private

  def questionbank_params
    params.require(:questionbank).permit :questionbank_subject, 
    	:questionbank_id, :questionbank_question, :questionbank_answer
  end

  def current_questionbank
    @questionbank = Questionbank.find_by params[:id]
    return if @questionbank
    flash[:error] = t ".no_questionbank"
    redirect_to questionbanks_path
  end

  protected

  def author
    @squestionbank= Questionbank.find_by params[:id]
  end
end
