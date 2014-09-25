class PlacesController < ApplicationController
	  before_action :authenticate_user!, :only => [:new, :create]
	  #devise filter

	def index
		@places = Place.all
		@places = Place.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 4)
	end

	def new
		@place = Place.new
	end

	def create
		# Place.create(place_params)
		# from devise we know current_user
		current_user.places.create(place_params)
		redirect_to root_path
		# can see in rake routes that #index is root
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

# this happens on the edit page submit button courtesy of simple_form
def update
	@place = Place.find(params[:id])
	@place.update_attributes(place_params)
	redirect_to root_path
end

def destroy
	@place = Place.find(params[:id])
	@place.destroy
	redirect_to root_path
end



	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
