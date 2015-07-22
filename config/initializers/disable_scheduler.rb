scheduler = Rufus::Scheduler.new
scheduler.cron '5 0 * * *' do
  users=User.where(:can_edit=>true)
  users.each do |user|
    user.can_edit=false
    user.save!
    puts "#{user.registerno}'s edit capability disabled"
  end
  FeedbackMailer.scheduler_message().deliver
end
