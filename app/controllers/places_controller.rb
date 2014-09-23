class PlacesController < ApplicationController
	def index
		@places = Place.all
		@placess = Place.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 5)
	end
end
