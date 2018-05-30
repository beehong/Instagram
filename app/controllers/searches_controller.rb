class SearchesController < ApplicationController

	def search
		if params[:query]
		@client = GooglePlaces::Client.new('AIzaSyCnMQ3Siz__--Rixhd7AUPsPqTF6SwBTCY')
		@a = @client.spots_by_query(params[:query])
		
		end
	end
	


end

