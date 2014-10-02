class Photo < ActiveRecord::Base
	belongs_to :place
	  mount_uploader :photo, PictureUploader
end
