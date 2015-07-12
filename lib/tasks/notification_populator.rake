namespace :notification_populator do
  task :add_dummy_entry=>:environment do
    notfication=Notification.new
    notifcation.title="Notification"
    notification.message="Any change will be notified here.Watch this space regularly"
    notifcation.save
    puts "Dummy notifcation created"
  end
end
