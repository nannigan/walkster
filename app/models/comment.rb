class Comment < ActiveRecord::Base
	belongs_to :place
	belongs_to :user


RATINGS = {
 'one star' => '1_star', 
 'two stars' => '2_stars', 
 'three stars' => '3_stars', 
 'four stars' => '4_stars', 
 'five stars' => '5_stars' 
}

  def humanized_rating
    RATINGS.invert[self.rating]
    # returns 'one star' rather than '1_star'
  end
end
