class FeedbackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.send_message.subject
  #
  def send_message(from,subject,message)
    @subject = subject
    @from=from
    @message=message
    mail(from:from,to: "sureshprasanna70@gmail.com",subject:@subject)
  end
end
