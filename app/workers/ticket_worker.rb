class TicketWorker
  include Sidekiq::Worker
  def perform(from,subject,registerno,message)
    uri = URI.parse('https://cuic.freshdesk.com/helpdesk/tickets.json')  
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      req = Net::HTTP::Post.new(uri.path)  
      req.basic_auth 'sureshprasanna70@gmail.com', 'a.9443892889'  
      req.add_field("Content-Type","application/json")
      ticket_subject=subject+"< "+registerno+" >"
      request_body='{ "helpdesk_ticket": { "description": "'+message+'", "subject": "'+ticket_subject+'", "email": "'+from+'"}, "cc_emails": "[sureshprasanna70@gmail.com,rrdharmesh@gmail.com]" }'
      puts request_body
      req.body=request_body
      res=http.request(req)
      puts res.body
    end
  end
end
