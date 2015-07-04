class ExcelWorker
  include Sidekiq::Worker
  def perform(path)
    spreadsheet=Roo::Excel.new(path)
    sheet=spreadsheet.sheet(1)
    
    rollno_pass={}
    start_number=sheet.row(2)[0].to_i.to_s
    end_number=sheet.row(sheet.last_row)[0].to_i.to_s
      (2..sheet.last_row).each do |row_num|
         i=sheet.row(row_num)[0].to_i.to_s
         password=Random.rand(20**20)
         puts i 
         puts password
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
    ws=Workstatus.new
    ws.numrange=file
    ws.status="done"
    ws.filename="excelsheet/"+file
    ws.save
    pgsheet=spreadsheet.sheet(3)
    rollno_pass={}
    start_number=sheet.row(2)[0].to_i.to_s
    end_number=sheet.row(sheet.last_row)[0].to_i.to_s
      (2..sheet.last_row).each do |row_num|
         i=sheet.row(row_num)[0].to_i.to_s
         password=Random.rand(20**20)
         puts i 
         puts password
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
    ws=Workstatus.new
    ws.numrange=file
    ws.status="done"
    ws.filename="excelsheet/"+file
    ws.save

  end
end
