class CollegeProfilesController < ApplicationController
  before_action :set_college_profile, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  before_filter :edit_check,only:[:edit,:update,:destroy,:new]
  respond_to :js,:html
  # GET /college_profiles
  # GET /college_profiles.json
  def index
    @college_profiles = current_user.college_profile
    @degree=Course.where(:branch_code=>@college_profiles.branch).first
    @degrees=@degree.branch
  end

  # GET /college_profiles/1
  # GET /college_profiles/1.json
  def show
  end

  # GET /college_profiles/new
  def new
    @college_profile = CollegeProfile.new
    @courses=Course.all
  end

  # GET /college_profiles/1/edit
  def edit
    @courses=Course.all
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
  def excel_dump
    if user_signed_in?
      if current_user.has_role? "admin"
        p=ActiveRecord::Base.connection.execute("SELECT users.name, users.registerno, college_profiles.degree,college_profiles.branch,users.phone,users.email FROM `users` LEFT OUTER JOIN college_profiles ON users.id = college_profiles.user_id")
        Spreadsheet.client_encoding = 'UTF-8'
        book = Spreadsheet::Workbook.new
        sheet1 = book.create_worksheet :name => 'test'
        filename=Rails.root.to_path+'/tmp/'+Date.today.to_s+'.xls'
        dept=""
        i=0;
        p.each do |ps|
          status="complete"
          if not ps[2].nil? and not ps[3].nil?
            degree=@degrees[0][ps[2]][0]
            dept=degree.key(ps[3])
          end
          if ps[4]=="" 
            logger.debug "phone incompletes #{ps[2]}"
            status="incomplete"
          end
          if ps[5]==""
            logger.debug "email incomplete #{ps[2]}"
            status="incomplete"
          end
          sheet1.row(i).push ps[0], ps[1], ps[2].to_s,dept,ps[4],ps[5],status
          i+=1;
        end
        book.write filename
        send_file filename
      end
    end
  end
  def getdegree
    @courses=Course.where(:degree=>params[:degree])
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
  def edit_check
    if not current_user.can_edit?
      respond_to do |format|
        @error_message="Add and Edit disabled"
        format.js{render 'layouts/edit_disable',notice:'Edit disabled'}
        format.html{redirect_to resume_path,alert:'Delete disabled'}
      end
    end

  end
end
