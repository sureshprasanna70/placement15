class AcademicDetailsController < ApplicationController
  before_action :set_academic_detail, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  # GET /academic_details
  # GET /academic_details.json
  def index
    @academic_details = AcademicDetail.all
  end

  # GET /academic_details/1
  # GET /academic_details/1.json
  def show
  end

  # GET /academic_details/new
  def new
    @academic_detail = AcademicDetail.new
  end

  # GET /academic_details/1/edit
  def edit
  end

  # POST /academic_details
  # POST /academic_details.json
  def create
    @academic_detail = AcademicDetail.new(academic_detail_params)
    @academic_detail.user_id=current_user.id
    respond_to do |format|
      if @academic_detail.save
        format.html { redirect_to @academic_detail, notice: 'Academic detail was successfully created.' }
        format.json { render :show, status: :created, location: @academic_detail }
      else
        format.html { render :new }
        format.json { render json: @academic_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_details/1
  # PATCH/PUT /academic_details/1.json
  def update
    respond_to do |format|
      if @academic_detail.update(academic_detail_params)
        format.html { redirect_to @academic_detail, notice: 'Academic detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_detail }
      else
        format.html { render :edit }
        format.json { render json: @academic_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_details/1
  # DELETE /academic_details/1.json
  def destroy
    @academic_detail.destroy
    respond_to do |format|
      format.html { redirect_to academic_details_url, notice: 'Academic detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_detail
      @academic_detail = AcademicDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_detail_params
      params.require(:academic_detail).permit(:course, :institution, :examination_authority, :pass_year, :percentage,:user_id)
    end
    def sign_in_check
      if not user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
