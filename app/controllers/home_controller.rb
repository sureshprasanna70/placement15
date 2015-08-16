class HomeController < ApplicationController
  before_filter :sign_in_check,only:[:index,:resume,:print]
  def index
    @companies=Company.all
    @notifications=Notification.all
  end
  def resume
  end
  def faq
  end
  def feedback
  end
  def print
    @personal_profile=current_user.personal_profile
    @college_profile=current_user.college_profile
    @academic_details=current_user.academic_detail
    @projects=current_user.project
    @extra_activities=current_user.extra_activity
    barcode= Barby::Code128B.new(current_user.registerno)
    File.open('data/barcode/'+current_user.registerno+'.png', 'w'){|f|
      f.write barcode.to_png
    }
    hash_to_name
    respond_to do |format|
      format.html 
      format.pdf  do
        render pdf: "resume",
          layout:'wicked_pdf.html',
          show_as_html:params[:debug].present?,
          outline: {   outline:           true,  outline_depth:     5 },
          margin:  {   top:               30,                     # default 10 (mm)
                       bottom:            40,
                       left:              20,
                       right:             20 },
                       footer: {                     html: {template:'home/footer.pdf.erb',
                                                            spacing:70,
                                                            padding:25,
                                                            bottom:15,
                                                            line:true}}
      end
    end   
  end
  def hash_to_name
    set_degree
    if not @college_profile.degree.nil?
      degree=@degrees[0][@college_profile.degree][0]
      @dept=degree.key(@college_profile.branch)
    end
  end
  def submit
    all_details=User.includes(:personal_profile,:college_profile,:semester_mark,:extra_activity,:project,:academic_detail).where(:id=>current_user.id).references(:user)
    @user=all_details.first
    branch=Course.where(:branch_code=>@user.college_profile.branch).first
    @branch=branch.branch
  end
  def complete
    @user=User.find(current_user.id)
    if @user.can_edit?
      @user.can_edit=false
      @user.save!
      flash[:notice]="You are done"
    else 
      flash[:notice]="Thanks.You have already done"
    end
    redirect_to resume_path 
  end
  def send_feedback
    from=params[:from]
    subject=params[:subject]
    rollno=params[:registerno]
    message=params[:message]
    TicketWorker.perform_async(from,subject,rollno,message)
    flash[:notice]="We'll get back to you shortly"
    redirect_to root_path
  end
  private
  def set_degree
    @degrees=["BE"=>["Aeronautical Engineering"=>"AE","Architecture"=>"AR","Agriculture & Irrigation Engineering"=>"AI","Apparel Technology"=>"AP","Automobile Engineering"=>"AU","Bio-Medical Engineering"=>"BM","Ceramic Technology"=>"CR","Chemical Engineering"=>"CH","Civil Engineering"=>"CE","Computer Science and Engg."=>"CS","Electrical and Electronics"=>"EE","Electronics & Communication"=>"EC","Electronics & Instrumentation"=>"EI","Food Technology"=>"FT","Geo-Informatics"=>"GI","Industrial Bio-Technology"=>"IB","Industrial Engineering"=>"IE","Information Technology"=>"IT","Leather Technology"=>"LE","Manufacturing Engineering"=>"MN","Material Science &  Engineering"=>"MS","Mechanical Engineering"=>"ME","Mining Engineering"=>"MI","Pharmaceutical Technology"=>"PH","Printing Technology"=>"PT","Production Engineering"=>"PE","Rubber and Plastics Technology"=>"RP","Textile Technology"=>"TX"],"ME"=>["Hydrology & Water Ress. Engg"=>"HW","Soil Mechcs & Foundn. Engg"=>"SM","Structural Engineering"=>"SE","Construction Engg. & Mgmt."=>"CN","Geomatics"=>"GIC","Transportation Engineering"=>"TE","Environmental Engineering"=>"EN","Irrigation Water Management"=>"IW","Integrated Water Resource Mgmt."=>"IWR","Environmental Management"=>"EM","Engineering Design"=>"ED","Internal Combustion Engg"=>"IC","Thermal Engg"=>"RA","Energy Engineering"=>"EG","Computer Integrated Manufacturing"=>"CIM","Industrial   Engineering"=>"IE","Manufacturing Systems and Mgt."=>"MSM","Solar Energy"=>"SO","Aeronautical Engineering"=>"AE","Avionics"=>"AV","Aerospace"=>"AS","Automobile Engineering"=>"AU","Manufacturing Engineering"=>"MAN","Mechatronics"=>"MT","High Voltage Engineering"=>"HV","Power Systems Engineering"=>"PS","Power Electronics and Drives"=>"PL","Power Engineering & Management"=>"PEM","Control and Instrumentation Engg"=>"CI","Embedded Systems Technologies"=>"EST","Instrumentation Engineering"=>"IN","Applied Electronics"=>"AL","Biomedical Engineering"=>"BM","Medical Electronics"=>"ML","Communication Systems"=>"CMS","V.L.S.I. Design"=>"VL","Communication & Networking"=>"CNW","Computer Science and Engg."=>"CS","Software Engineering"=>"SW","Multi-Media Technology"=>"MMT","Information Technology"=>"IT"],"MTech"=>["Environmental Science & Tech."=>"EVT","Remote Sensing"=>"RS","LASER & Electro-Optical Engg"=>"LE","Polymer Science and Engg."=>"PM","Coastal Management"=>"CM","Chemical Engineering"=>"CH","Ceramic Technology"=>"CT","Petroleum Refining and Petro-Chemicals"=>"PR","Bio-Technology"=>"BT","Bio-Pharmaceutical Technology"=>"PHT","Food Technology"=>"FT","Textile Technology"=>"TT","Leather Technology"=>"LT","Footwear Science and Engg."=>"FS","Nano Science and Technology"=>"NS","Industrial Safety & Hazard Management"=>"IS","Printing & & Packaging Technology"=>"PPT","Rubber Technology"=>"RT","Computational Biology"=>"CB"],"MArch"=>["Landscape Architecture"=>"LAR","Digital Architecture"=>"DA"],"Mplan"=>["Town and Country Planning"=>"TP","Landscape Architecture"=>"LA"],"MSc(5yrs)"=>["Computer Science"=>"CSM","Information Technology"=>"ITM","Electronic Media"=>"ELM"],"Msc"=>["Applied Mathematics"=>"AM","Material Science"=>"MS","Medical Physics"=>"MP","Applied Chemistry"=>"AC","Applied Geology"=>"AG","Environmental Science"=>"ES","Electronics Media"=>"EMI"],"MBA"=>["Master of Business Administration"=>"MBA","Master of Business Administration – Tourism Management"=>"MBATM"],"MCA"=>["Master of Computer Applications"=>"MCA"],"MPlan"=>["Town and Country Planning"=>"MTCP"],"BArch"=>["Bachelor of Architecture"=>"BArch"],"MSc"=>["Applied Mathematics"=>"AM","Material Science"=>"MS","Medical Physics"=>"MP","Applied Chemistry"=>"AC","Applied Geology"=>"AG","Environmental Science"=>"ES","Electronics Media"=>"EMI"],"BTech"=>["Information Technology"=>"IT"]]

  end
  def sign_in_check
    if not user_signed_in?
      redirect_to new_user_session_path
    else
      if current_user.email=="" and current_user.phone=""
        flash[:alert]="Your email and phone field is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
        redirect_to edit_user_registration_path
      else
        if current_user.email==""
          flash[:alert]="Your email is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
          redirect_to edit_user_registration_path
        end
        if current_user.phone==""
          flash[:alert]="Your phone is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
          redirect_to edit_user_registration_path
        end
      end
    end
  end
end
