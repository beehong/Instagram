class SearchesController < ApplicationController

	def search
		if params[:query]
		@client = GooglePlaces::Client.new(ENV['API'])
		@a = @client.spots_by_query(params[:query])
		
		end
	end
	


end

