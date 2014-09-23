class PlacesController < ApplicationController
	def index
		@places = Place.all
		@places = Place.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 4)
	end
end
