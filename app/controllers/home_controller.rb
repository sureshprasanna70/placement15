class HomeController < ApplicationController
  before_action :sign_in_check ,only:[:index,:resume]
  def index
    @companies=Company.all
  end
  def resume
  end
  def faq
  end
  private
  def sign_in_check
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
