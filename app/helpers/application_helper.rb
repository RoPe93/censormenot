module ApplicationHelper

  def is_localhost?
    request.ip == "127.0.0.1"
  end
end
