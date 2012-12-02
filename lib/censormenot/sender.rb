require 'socket'

module Censormenot
  module Sender
    module_function
    def send_request(request)
      # Send multicast packet containing a query
      multicast_addr = "225.193.193.193"
      port = 25193

      begin
        socket = UDPSocket.open
        socket.setsockopt(Socket::IPPROTO_IP, Socket::IP_TTL, [255].pack('i'))
        socket.send("censormenot|q|#{request.domain}", 0, multicast_addr, port)
      rescue

      ensure
        socket.close
      end
  
    end


    def work
      RequestedDomain.all.each do | request |
        send_request request
        sleep 10
      end
    end
  end
end
