class ExamsController < ApplicationController
  before_action :current_exam, only: %i(show edit update destroy)
  before_action :author, :only => [:edit, :destroy, :show]

  def index
    @q = Exam.ransack params[:q]
    @exams = @q.result
  end

  def show
  	Questionbank.order("RAND()").limit(3)
  end

  def create
    exam = Exam.create exam_params
    redirect_to exams_path
  end

  def new
    @exam = Exam.new
  end

  def edit; end

  def update
    if
      @exam = Exam.find(params[:id])
      @exam.update(exam_params)
      redirect_to exam_path(@exam)
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit :exam_name, :exam_subject, :exam_id
  end

  def questionbank_params
    params.require(:questionbank).permit :questionbank_subject, :questionbank_id, :questionbank_question, :questionbank_answer
  end

  def current_exam
    @exam = Exam.find_by params[:id]
    return if @exam
    flash[:error] = t ".no_exam"
    redirect_to exams_path
  end

  protected

  def author
    @exam = Exam.find_by params[:id]
  end
end
