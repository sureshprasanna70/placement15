namespace :user_gen do
desc "gen"
task :admin_user=>:environment do
  user=User.new(:email=>"cuic.annauniv@gmail.com",:password=>"12345678",:password_confirmation=>"12345678",:registerno=>"111111",:name=>"Admin")
user.save
user.add_role "admin"
end
end
