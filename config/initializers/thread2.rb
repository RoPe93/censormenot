require 'net/http'

require 'socket'
require 'ipaddr'
require 'ipaddress'


if RUNNING_SERVER
  scheduler = Rufus::Scheduler.start_new


  scheduler.in("0s") do
    multicast_addr = "225.192.192.192"
    port = 25192

    ip =  IPAddr.new(multicast_addr).hton + IPAddr.new("0.0.0.0").hton

    sock = UDPSocket.new
    sock.setsockopt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, ip)
    sock.bind(Socket::INADDR_ANY, port)

    loop do
      msg, info = sock.recvfrom(1024)

      if not valid_answer? msg, info
        next
      end 

      data = msg.split('|')

      StagedRecord.create :domain => data[2],
          :ip => data[3],
          :trust => data[4],
          :answered_by => info[2]

    end
  end
end
