class LookupsController < ApplicationController
  def lookup_form
    @domain = nil
  end

  def search
    @domain = params[:domain]
    @lookups = Lookup.where(:domain=>@domain)
  end

  def dump
    @lookups = Lookup.all()

    respond_to do |format|
      format.json {render :json => @lookups}
    end
  end
end
