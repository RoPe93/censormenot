class LookupsController < ApplicationController
  def lookup_form
    @domain = nil
  end

  def search
    @domain = params[:domain]
    @lookups = Lookup.where(:domain=>@domain).order("trust DESC")
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
        render :text => "Lookup saved"
      else
        render :text => "There was some error"
      end
    else
      render :text => "Lookup not found"
    end
  end
end
