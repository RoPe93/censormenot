class RequestsController < ApplicationController
  def new
    @request = RequestedDomain.new
  end

  def create
    @request = RequestedDomain.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to "/requests", :notice => "Request saved" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def index
    @requests = RequestedDomain.all
  end

end
