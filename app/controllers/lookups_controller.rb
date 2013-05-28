class LookupsController < ApplicationController
  before_filter :allow_localhost_only, :except => [:lookup_form, :search]

  def lookup_form
    @domain = nil
  end

  def search
    @domain = params[:domain].gsub(/[^a-zA-Z0-9\-\.]/, "")
    @lookups = Lookup.where("domain like ?", @domain).order("trust DESC")
  end

  def dump
    @lookups = Lookup.all()

    respond_to do |format|
      format.json {render :json => @lookups}
    end
  end

  def vote
    @lookup = Lookup.find_by_id(params[:id])
    @vote = params[:vote]

    if @lookup
      @lookup.trust = @vote
      if @lookup.save
        render :text => "Vote registered"
      else
        render :text => "There was some error"
      end
    else
      render :text => "Lookup not found"
    end
  end

  def index
    @lookups = Lookup.all
  end

  def new
    @lookup = Lookup.new()
  end

  def create
    @lookup = Lookup.new(params[:lookup])
    @lookup.trust = 1

    respond_to do |format|
      if @lookup.save
        format.html { redirect_to "/lookups", :notice => "Lookup saved" }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
