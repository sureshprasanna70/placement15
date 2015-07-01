class RollWorker
  include Sidekiq::Worker
  def perform(start_number,end_number)
    start_num=start_number.to_i
    end_num=end_number.to_i
    rollno_pass={}
    for i in start_num..end_num
      password=Random.rand(10**10)
      User.create!({:email => "", :phone=>"",:registerno=>i, :password => password, :password_confirmation => password })
      rollno_pass[i]=password
    end
    directory=File.dirname(Rails.root)
    directory=directory+"/placement/data/excelsheet"
    file=start_number+"-"+end_number+".csv"
    CSV.open(File.join(directory,file), 'w' ) do |writer|
      rollno_pass.each do |key,value|
        puts value
        writer<<[key,value]
      end
    end
    @ws=Workstatus.new
    @ws.numrange=start_number+"-"+end_number
    @ws.status="done"
    @ws.filename="excelsheet/"+file
    @ws.save
  end
end
