class PersonalProfilesController < ApplicationController
  before_action :set_personal_profile, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check 
  respond_to :js,:html
  # GET /personal_profiles
  # GET /personal_profiles.json
 def index
   @personal_profiles =current_user.personal_profile
  end

  # GET /personal_profiles/1
  # GET /personal_profiles/1.json
  def show
  end

  # GET /personal_profiles/new
  def new
    @personal_profile = PersonalProfile.new
  end

  # GET /personal_profiles/1/edit
  def edit
  end

  # POST /personal_profiles
  # POST /personal_profiles.json
  def create
    @personal_profile = PersonalProfile.new(personal_profile_params)
    @personal_profile.user_id=current_user.id
    respond_to do |format|
      if @personal_profile.save
        format.html { redirect_to resume_path, notice: 'Personal profile was successfully created.' }
        format.json { render :show, status: :created, location: resume_path }
      else
        format.html { render :new }
        format.json { render json: @personal_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_profiles/1
  # PATCH/PUT /personal_profiles/1.json
  def update
    respond_to do |format|
      if @personal_profile.update(personal_profile_params)
        format.html { redirect_to resume_path, notice: 'Your Personal profile was successfully updated.' }
        format.json { render :show, status: :ok, location: resume_path }
      else
        format.html { render :edit }
        format.json { render json: @personal_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_profiles/1
  # DELETE /personal_profiles/1.json
  def destroy
    @personal_profile.destroy
    respond_to do |format|
      format.html { redirect_to resume_path, notice: 'Personal profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_profile
      @personal_profile = current_user.personal_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_profile_params
      params.require(:personal_profile).permit(:gender, :dob, :age, :height, :weight, :guardian_name, :guardian_occupation, :nationality, :mother_tongue,:user_id,:current_address,:permanent_address)
    end
    def sign_in_check
      if not user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
