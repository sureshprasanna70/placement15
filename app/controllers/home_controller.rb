class HomeController < ApplicationController
  before_filter :sign_in_check,only:[:index,:resume]
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
  def send_feedback
    
    from=params[:from]
    subject=params[:subject]
    rollno=params[:registerno]
    message=params[:message]
    TicketWorker.perform_async(from,subject,rollno,message)
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
