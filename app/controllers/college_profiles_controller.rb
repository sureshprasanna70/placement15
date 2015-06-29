class CollegeProfilesController < ApplicationController
  before_action :set_college_profile, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  respond_to :js,:html
  # GET /college_profiles
  # GET /college_profiles.json
  def index
    @college_profiles = current_user.college_profile
  end

  # GET /college_profiles/1
  # GET /college_profiles/1.json
  def show
  end

  # GET /college_profiles/new
  def new
    @college_profile = CollegeProfile.new
  end

  # GET /college_profiles/1/edit
  def edit
  end

  # POST /college_profiles
  # POST /college_profiles.json
  def create
    @college_profile = CollegeProfile.new(college_profile_params)
    @college_profile.user_id=current_user.id
    respond_to do |format|
      if @college_profile.save
        format.html { redirect_to '/resume', notice: 'You have an college profile now.' }
        format.json { render :show, status: :created, location: @college_profile }
      else
        format.html { render :new }
        format.json { render json: @college_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /college_profiles/1
  # PATCH/PUT /college_profiles/1.json
  def update
    respond_to do |format|
      if @college_profile.update(college_profile_params)
        format.html { redirect_to '/resume', notice: 'Update Successful.' }
        format.json { render :show, status: :ok, location: @college_profile }
      else
        format.html { render :edit }
        format.json { render json: @college_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /college_profiles/1
  # DELETE /college_profiles/1.json
  def destroy
    @college_profile.destroy
    respond_to do |format|
      format.html { redirect_to '/resume', notice: 'College profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_college_profile
    @college_profile = CollegeProfile.find(params[:id])
    if not @college_profile.user_id==current_user.id
      redirect_to root_path
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def college_profile_params
    params.require(:college_profile).permit(:level, :degree, :branch, :college, :semester, :cgpa)
  end
  def sign_in_check
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
