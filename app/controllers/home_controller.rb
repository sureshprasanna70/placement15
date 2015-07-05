class HomeController < ApplicationController
  before_filter :sign_in_check
  def index
    @companies=Company.all
    @notifications=Notification.all
  end
  def resume
  end
  def faq
  end
  private
  def sign_in_check
    puts "phone and email"
    if not user_signed_in?
      redirect_to new_user_session_path
    else
      if current_user.email=="" and current_user.phone=""
        flash[:alert]="Your email and phone field is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
      else
        if current_user.email==""
          flash[:alert]="Your email is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
        else
          flash[:alert]="Your phone is empty.Please fill it <a href='"+url_for(edit_user_registration_path)+"'>here</a>"
        end
      end
    end
  end
end
