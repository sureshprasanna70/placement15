scheduler = Rufus::Scheduler.new
scheduler.cron '5 0 * * *' do
  users=User.where(:can_edit=>true)
  registerno=" "
  users.each do |user|
    user.can_edit=false
    user.save!
    registerno+=user.registerno+","
  end
  FeedbackMailer.scheduler_message(registerno).deliver
end
