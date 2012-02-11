class LookupsController < ApplicationController
  def lookup_form
  end

  def search
    @lookup = Lookup.where(:domain=>params[:domain])
  end

  def dump
    @lookups = Lookup.all()

    respond_to do |format|
      format.json {render :json => @lookups}
    end
  end
end
