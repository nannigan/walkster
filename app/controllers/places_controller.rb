class PlacesController < ApplicationController
	def index
		@places = Place.all
		@places = Place.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 4)
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params)
		redirect_to root_path
		# can see in rake routes that #index is root
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
