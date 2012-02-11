require 'net/http'

def get_random_ips
  res = Net::HTTP.get('ekiga.net', '/ip/')
  quads = res.split('.').map{|q| q.to_i}

  ips = []

  4.times do # randomize last quad
    begin
      last = rand(256)
    end while last == quads[3]
    new_ip = quads.dup
    new_ip[3] = last
    ips << new_ip
  end

  4.times do # randomize last 2 quads
    begin
      last1 = rand(256)
      last2 = rand(256)
    end while last1 == quads[2] and last2 == quads[3]
    new_ip = quads.dup
    new_ip[2] = last1
    new_ip[3] = last2
    ips << new_ip
  end

  4.times do # randomize last 3 quads
    begin
      last1 = rand(256)
      last2 = rand(256)
      last3 = rand(256)
    end while last1 == quads[1] and last2 == quads[2] and last3 == quads[3]
    new_ip = quads.dup
    new_ip[1] = last1
    new_ip[2] = last2
    new_ip[3] = last3
    ips << new_ip
  end

  4.times do # randomize all quads
    begin
      last1 = rand(256)
      last2 = rand(256)
      last3 = rand(256)
      last4 = rand(256)
    end while (last1 == quads[0] and last2 == quads[1] and last3 == quads[2] and last4 == quads[3]) or last1 == 0
    new_ip = quads.dup
    new_ip[0] = last1
    new_ip[1] = last2
    new_ip[2] = last3
    new_ip[3] = last4
    ips << new_ip
  end

  ips
end


scheduler = Rufus::Scheduler.start_new

def check_server(host, port)
  begin
    p "#{host}:#{port}"
    socket = TCPSocket.new(host, port)
    socket.close()
    hp = HostAndPort.new({:name=>"#{host}:#{port}"})
    p "S-a salvat #{hp.save()}"

  rescue
  end
end

#scheduler.every("5s") do
  #hosts = get_random_ips
  #hosts.each do |host|
    #host = host.join('.')
    #p host
    #check_server(host, 3000)
  #end
#end
