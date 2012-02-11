scheduler = Rufus::Scheduler.start_new
hosts = [
  {:host => "localhost", :port=>3000},
  {:host => "localhost", :port=>6000},
  {:host => "localhost", :port=>5000},
]

def check_server(host, port)
  begin
    socket = TCPSocket.new(host, port)
    HostAndPort.create({:name=>"#{host}:#{port}"})
  rescue
  end
end

scheduler.every("5s") do
  hosts.each do |host|
    check_server(host[:host], host[:port])
  end
end
