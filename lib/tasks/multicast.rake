namespace :multicast do
  desc "Receive a multicast packet"
  task :recieve => :environment do
  end
  
  desc "Answer lookup requests"
  task :answerer => :environment do
    Censormenot::Answerer.work
  end
  
  desc "Send request <:id> on multicast"
  task :send, [:id] => [:environment] do |t, args|
    request = RequestedDomain.find_by_id args[:id]
    
    if request.nil?
      logger.error "Request with id: #{args[:id]} does not exist"
    else
      Censormenot::Sender.send_request request
    end
  end
end