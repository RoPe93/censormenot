class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_localhost

  end

  def allow_localhost_only
    if request.remote_ip != '127.0.0.1'
      redirect_to '/'
    end
  end
end
