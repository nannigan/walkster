class Place < ActiveRecord::Base

belongs_to :user
geocoded_by :address #because we already have address col in table?
after_validation :geocode

validates :name, :presence => true, length: 3..60
validates :description, :presence => true  
validates :address, :presence => true


end
