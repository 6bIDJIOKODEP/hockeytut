class PagesController < ApplicationController

  before_action :set_tournament, only: [:show, :show_camp]
	require 'will_paginate/array'

  def search_camp
    



  	@search = Tournament.where("tournament_type = 'camp'").search(params[:q])
  	@tournaments = @search.result
		@hash = Gmaps4rails.build_markers(@tournaments) do |tournament, marker|
			@tournament = tournament
		  marker.lat tournament.latitude
		  marker.lng tournament.longitude
		  marker.json({:id => tournament.id})
			marker.infowindow render_to_string(:action => 'show_camp', :layout => false)
		end

		@categories = ["Players", "Goalkeepers", "All"]
		
  end





  def search

  	@search = Tournament.where("tournament_type = 'tournament'").search(params[:q])
  	@tournaments = @search.result
		@hash = Gmaps4rails.build_markers(@tournaments) do |tournament, marker|
			@tournament = tournament
		  marker.lat tournament.latitude
		  marker.lng tournament.longitude
		  marker.json({:id => tournament.id})
			marker.infowindow render_to_string(:action => 'show', :layout => false)
		end


  	@categories = ["98-99", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", 
    "2008", "2009", "2010", "U-18", "U-20", "Women", "Amateur", "Professional", "Other"]

  end



  def show
  	respond_with(@tournament, :layout =>  !request.xhr?)	
  end

  def show_camp
  	respond_with(@tournament, :layout =>  !request.xhr?)	
  end

	def home

  	@categories = ["98-99", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", 
    "2008", "2009", "2010", "U-18", "U-20", "Women", "Amateur", "Professional", "Other"]


    @search = Tournament.search(params[:q])
    @tournaments = @search.result.paginate(:page => params[:page], :per_page => 8)

	end

	def rules
	end

	def privacy_policy		
	end

	def terms_of_use		
	end

	def ads
		@contact = Contact.new
	end

	def close_account		
	end

	def my_ads
		@tournaments = current_user.tournaments.paginate(:page => params[:page], :per_page => 5)
	end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

end
