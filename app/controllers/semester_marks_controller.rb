class SemesterMarksController < ApplicationController
  before_action :set_semester_mark, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  # GET /semester_marks
  # GET /semester_marks.json
  def index
    @semester_marks = current_user.semester_mark
  end

  # GET /semester_marks/1
  # GET /semester_marks/1.json
  def show
  end

  # GET /semester_marks/new
  def new
    @semester_mark = SemesterMark.new
  end

  # GET /semester_marks/1/edit
  def edit
  end

  # POST /semester_marks
  # POST /semester_marks.json
  def create
    @semester_mark = SemesterMark.new(semester_mark_params)
    @semester_mark.user_id=current_user.id
    respond_to do |format|
      if @semester_mark.save
        format.html { redirect_to resume_path, notice: 'Semester mark was successfully created.' }
        format.json { render :show, status: :created, location: @semester_mark }
      else
        format.html { render :new }
        format.json { render json: @semester_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semester_marks/1
  # PATCH/PUT /semester_marks/1.json
  def update
    respond_to do |format|
      if @semester_mark.update(semester_mark_params)
        format.html { redirect_to resume_path,notice: 'Semester mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester_mark }
      else
        format.html { render :edit }
        format.json { render json: @semester_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semester_marks/1
  # DELETE /semester_marks/1.json
  def destroy
    @semester_mark.destroy
    respond_to do |format|
      format.html { redirect_to semester_marks_url, notice: 'Semester mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_semester_mark
    @semester_mark = SemesterMark.find(params[:id])
    if not @semester_mark.user_id==current_user.id
      redirect_to root_path
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def semester_mark_params
    params.require(:semester_mark).permit(:semester, :gpa, :pass_year,:user_id)
  end
  def sign_in_check
    if not user_signed_in?
      redirect_to new_user_session_path
    else
      if not current_user.can_edit?
        flash[:alert]="Edit disabled"
        redirect_to resume_path
      end

    end
  end
end
