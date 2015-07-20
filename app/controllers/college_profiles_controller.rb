class CollegeProfilesController < ApplicationController
  before_action :set_college_profile, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  before_filter :edit_check,only:[:edit,:update,:destroy,:new]
  before_action :set_degree,only:[:new,:edit,:getdegree,:excel_dump,:index]
  respond_to :js,:html
  # GET /college_profiles
  # GET /college_profiles.json
  def index
    @college_profiles = current_user.college_profile
    if not @college_profiles.nil?
      @degree=@college_profiles.degree.gsub(/^\+|\+$/, '')
      puts @degree
    end
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
          logger.debug "#{ps[0]},#{ps[1]},#{ps[2].to_s},#{dept},#{ps[4]},#{ps[5]},#{status}"
          sheet1.row(i).push ps[0], ps[1], ps[2].to_s,dept,ps[4],ps[5],status
          i+=1;
        end
        book.write filename
        send_file filename
      end
    end
  end
  def getdegree
    @degree=@degrees[0][params[:degree]][0]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_college_profile
    @college_profile = CollegeProfile.find(params[:id])
    if not @college_profile.user_id==current_user.id
      redirect_to root_path
    end

  end
  def set_degree
    @degrees=["BE"=>["Aeronautical Engineering"=>"AE","Architecture"=>"AR","Agriculture & Irrigation Engineering"=>"AI","Apparel Technology"=>"AP","Automobile Engineering"=>"AU","Bio-Medical Engineering"=>"BM","Ceramic Technology"=>"CR","Chemical Engineering"=>"CH","Civil Engineering"=>"CE","Computer Science and Engg."=>"CS","Electrical and Electronics"=>"EE","Electronics & Communication"=>"EC","Electronics & Instrumentation"=>"EI","Food Technology"=>"FT","Geo-Informatics"=>"GI","Industrial Bio-Technology"=>"IB","Industrial Engineering"=>"IE","Information Technology"=>"IT","Leather Technology"=>"LE","Manufacturing Engineering"=>"MN","Material Science &  Engineering"=>"MS","Mechanical Engineering"=>"ME","Mining Engineering"=>"MI","Pharmaceutical Technology"=>"PH","Printing Technology"=>"PT","Production Engineering"=>"PE","Rubber and Plastics Technology"=>"RP","Textile Technology"=>"TX"],"ME"=>["Hydrology & Water Ress. Engg"=>"HW","Soil Mechcs & Foundn. Engg"=>"SM","Structural Engineering"=>"SE","Construction Engg. & Mgmt."=>"CN","Geomatics"=>"GIC","Transportation Engineering"=>"TE","Environmental Engineering"=>"EN","Irrigation Water Management"=>"IW","Integrated Water Resource Mgmt."=>"IWR","Environmental Management"=>"EM","Engineering Design"=>"ED","Internal Combustion Engg"=>"IC","Thermal Engg"=>"RA","Energy Engineering"=>"EG","Computer Integrated Manufacturing"=>"CIM","Industrial   Engineering"=>"IE","Manufacturing Systems and Mgt."=>"MSM","Solar Energy"=>"SO","Aeronautical Engineering"=>"AE","Avionics"=>"AV","Aerospace"=>"AS","Automobile Engineering"=>"AU","Manufacturing Engineering"=>"MAN","Mechatronics"=>"MT","High Voltage Engineering"=>"HV","Power Systems Engineering"=>"PS","Power Electronics and Drives"=>"PL","Power Engineering & Management"=>"PEM","Control and Instrumentation Engg"=>"CI","Embedded Systems Technologies"=>"EST","Instrumentation Engineering"=>"IN","Applied Electronics"=>"AL","Biomedical Engineering"=>"BM","Medical Electronics"=>"ML","Communication Systems"=>"CMS","V.L.S.I. Design"=>"VL","Communication & Networking"=>"CNW","Computer Science and Engg."=>"CS","Software Engineering"=>"SW","Multi-Media Technology"=>"MMT","Information Technology"=>"IT"],"MTech"=>["Environmental Science & Tech."=>"EVT","Remote Sensing"=>"RS","LASER & Electro-Optical Engg"=>"LE","Polymer Science and Engg."=>"PM","Coastal Management"=>"CM","Chemical Engineering"=>"CH","Ceramic Technology"=>"CT","Petroleum Refining and Petro-Chemicals"=>"PR","Bio-Technology"=>"BT","Bio-Pharmaceutical Technology"=>"PHT","Food Technology"=>"FT","Textile Technology"=>"TT","Leather Technology"=>"LT","Footwear Science and Engg."=>"FS","Nano Science and Technology"=>"NS","Industrial Safety & Hazard Management"=>"IS","Printing & & Packaging Technology"=>"PPT","Rubber Technology"=>"RT","Computational Biology"=>"CB"],"MArch"=>["Landscape Architecture"=>"LAR","Digital Architecture"=>"DA"],"Mplan"=>["Town and Country Planning"=>"TP","Landscape Architecture"=>"LA"],"MSc(5yrs)"=>["Computer Science"=>"CSM","Information Technology"=>"ITM","Electronic Media"=>"ELM"],"Msc"=>["Applied Mathematics"=>"AM","Material Science"=>"MS","Medical Physics"=>"MP","Applied Chemistry"=>"AC","Applied Geology"=>"AG","Environmental Science"=>"ES","Electronics Media"=>"EMI"],"MBA"=>["Master of Business Administration"=>"MBA","Master of Business Administration – Tourism Management"=>"MBATM"],"MCA"=>["Master of Computer Applications"=>"MCA"],"MPlan"=>["Town and Country Planning"=>"MTCP"],"BArch"=>["Bachelor of Architecture"=>"BArch"],"MSc"=>["Applied Mathematics"=>"AM","Material Science"=>"MS","Medical Physics"=>"MP","Applied Chemistry"=>"AC","Applied Geology"=>"AG","Environmental Science"=>"ES","Electronics Media"=>"EMI"],"BTech"=>["Information Technology"=>"IT"]]

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
