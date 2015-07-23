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
    @academic_detail=current_user.academic_detail
    @projects=current_user.project
   respond_to do |format|
     format.pdf  do
       render pdf: "resume",
         layout:'wicked_pdf.html',
         show_as_html:params[:debug].present?
     end
    end   
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
