def valid_query?(msg, info)
  data = msg.split('|')

  return false if data[0] != "censormenot"
  
  return false if data[1] != "q"

  return false unless valid_domain? data[2]

  return true
end


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

def valid_answer?(msg, info)
  # TODO: validate incomming ip address
  
  data = msg.split('|')

  return false if data[0] != "censormenot"
  
  return false if data[1] != "a"
  
  return false unless valid_domain? data[2]

  return false unless valid_ip? data[3]

  return false unless  valid_trust? data[4]

  return true
end

