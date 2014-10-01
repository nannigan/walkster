class NotificationMailer < ActionMailer::Base
  default from: "no-reply@walksterapp.com"

  def comment_added
		  	@place = comment.place
		  	@place_owner = @place.user
  	    mail(to: @place_owner.email,
        subject: "wee haw,  a comment has been added to #{@place.name}!")
  end
end
