class PlacesController < ApplicationController
	  before_action :authenticate_user!, :only => [:new, :create, :edit, :update]
	  # user not authenticated won't see edit button see edit.html.erb
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
		@place = current_user.places.create(place_params)
		if @place.valid?
	    redirect_to root_path
			else
	    render :new, :status => :unprocessable_entity
		end
	end

	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@place = Place.find(params[:id])
		if @place.user != current_user
			    return render :text => 'NO NO Not Allowed', :status => :forbidden
		end
	end




# this happens on the edit page submit button courtesy of simple_form
def update
	@place = Place.find(params[:id])
	if @place.user != current_user
			    return render :text => 'No NO Not Allowed', :status => :forbidden
	end
	@place.update_attributes(place_params)
			if @place.valid?
	    redirect_to root_path
			else
	    render :new, :status => :unprocessable_entity
			end
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
