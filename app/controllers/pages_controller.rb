class PagesController < ApplicationController

	require 'will_paginate/array'

  def search_camp
    

		@categories = ["Players", "Goalkeepers", "All"]

	  if params[:search].present?
	  	@search = Tournament.where("tournament_type = 'camp'").near(params[:search], 200, :order => 'distance' ).search(params[:q])
	  	@tournaments = @search.result.paginate(:page => params[:page], :per_page => 8)
	  else
	  	@search = Tournament.where("tournament_type = 'camp'").search(params[:q])
	  	@tournaments = @search.result.paginate(:page => params[:page], :per_page => 8)
	  end


  end





  def search


  	@categories = ["98-99", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", 
    "2008", "2009", "2010", "U-18", "U-20", "Women", "Amateur", "Professional", "Other"]

    if params[:search].present?
    	@search = Tournament.where("tournament_type = 'tournament'").near(params[:search], 200, :order => 'distance' ).search(params[:q])
    	@tournaments = @search.result.paginate(:page => params[:page], :per_page => 8)
    else
    	@search = Tournament.where("tournament_type = 'tournament'").search(params[:q])
    	@tournaments = @search.result.paginate(:page => params[:page], :per_page => 8)
    end
  
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

end
