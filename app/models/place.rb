class Place < ActiveRecord::Base

belongs_to :user
validates :name, :presence => true, length: 3..60
#validates :password, presence: true, confirmation: true, if: :password_required?
# from the http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validates
validates :description, :presence => true  
validates :address, :presence => true


end
