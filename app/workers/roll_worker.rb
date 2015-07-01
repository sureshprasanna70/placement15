class RollWorker
  include Sidekiq::Worker
  def perform(start_number,end_number)
    start_num=start_number.to_i
    end_num=end_number.to_i
    rollno_pass=Hash
    for i in start_num..end_num
      password=Random.rand(2011000000)
      puts "#{i} password #{password}"
      User.create!({:email => "", :phone=>"",:registerno=>i, :password => password, :password_confirmation => password })
      rollno_pass[i=>password]
    end
   puts rollno_pass
  end
end
