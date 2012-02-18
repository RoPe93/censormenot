require 'net/http'

require 'socket'
require 'ipaddr'
require 'ipaddress'

scheduler = Rufus::Scheduler.start_new

def valid_domain?(domain)
  domain_regex = /^[a-zA-Z0-9\-\.]+/
  domain =~ domain_regex
end

def valid_ip?(ip)
  IPAddress.valid? ip
end

def valid_trust?(trust)
  begin
    x = Float(trust)
    0 <= x and x <= 1 
  rescue
    false
  end
end

def valid?(msg, info)
  # TODO: validate incomming ip address
  
  data = msg.split('|')

  return false if data[0] != "censormenot"
  
  return false if data[1] != "a"
  
  return false if not valid_domain? data[2]

  return false if not valid_ip? data[3]

  return false if not valid_trust? data[4]

  return true
end

scheduler.in("0s") do
  multicast_addr = "225.192.192.192"
  port = 25192

  ip =  IPAddr.new(multicast_addr).hton + IPAddr.new("0.0.0.0").hton

  sock = UDPSocket.new
  sock.setsockopt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, ip)
  sock.bind(Socket::INADDR_ANY, port)

  loop do
    msg, info = sock.recvfrom(1024)

    if not valid? msg, info
      next
    end 

    data = msg.split('|')

    StagedRecord.create :domain => data[2],
        :ip => data[3],
        :trust => data[4],
        :answered_by => info[2]

  end
end
