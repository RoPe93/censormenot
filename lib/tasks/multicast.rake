namespace :multicast do
  desc "Receive a multicast packet"
  task :receive => :environment do
      puts "Started receiving lookups on port 25193"
    Censormenot::Receiver.listen
  end
  
  desc "Answer lookup requests"
  task :answerer => :environment do
    puts "Started answering requests on port 25192"
    Censormenot::Answerer.work
  end
  
  desc "Send request <:id> on multicast"
  task :send, [:id] => [:environment] do |t, args|
    request = RequestedDomain.find_by_id args[:id]
    
    if request.nil?
      logger.error "Request with id: #{args[:id]} does not exist"
    else
      puts "Sending request for domain #{request.domain}"
      Censormenot::Sender.send_request request
    end
  end
end