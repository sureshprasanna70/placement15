class ExcelWorker
  include Sidekiq::Worker
  def perform(path)
    spreadsheet=Roo::Excel.new(path)
    sheet=spreadsheet.sheet(1)
    start_number=sheet.row(2)[0].to_i.to_s
    end_number=sheet.row(sheet.last_row)[0].to_i.to_s
    directory=File.dirname(Rails.root)
    directory=directory+"/placement/data/excelsheet"
    file=start_number+"-"+end_number+".csv"
    CSV.open(File.join(directory,file), 'w' ) do |writer|
      (2..sheet.last_row).each do |row_num|
         i=sheet.row(row_num)[0].to_i.to_s
         name=sheet.row(row_num)[1].to_s 
         password=Random.rand(15**15)
         puts "REGISTER NUMBER #{i} NAME #{name} PASSWORD #{password} "
         User.create!({:email => "", :phone=>"",:registerno=>i, :password => password, :password_confirmation => password,:name=>name })
         writer<<[i,password]
      end
    end
    ws=Workstatus.new
    ws.numrange=file
    ws.status="done"
    ws.filename="excelsheet/"+file
    ws.save
    puts "UG ENDS"
    puts "PG STARTS"
    pgsheet=spreadsheet.sheet(3)
    directory=File.dirname(Rails.root)
    directory=directory+"/placement/data/excelsheet"
    file=start_number+"-"+end_number+".csv"
    start_number=sheet.row(2)[0].to_i.to_s
    end_number=sheet.row(sheet.last_row)[0].to_i.to_s
    CSV.open(File.join(directory,file), 'w' ) do |writer|
      (2..sheet.last_row).each do |row_num|
         i=sheet.row(row_num)[0].to_i.to_s
         password=Random.rand(15**15)
         name=sheet.row(row_num)[1].to_s 
         puts "REGISTER NUMBER #{i} NAME #{name} PASSWORD #{password} "
         User.create!({:email => "", :phone=>"",:registerno=>i, :password => password, :password_confirmation => password,:name=>name })
         writer<<[i,password]
      end
    end
    ws=Workstatus.new
    ws.numrange=file
    ws.status="done"
    ws.filename="excelsheet/"+file
    ws.save
  end
end
