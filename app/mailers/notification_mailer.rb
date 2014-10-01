class NotificationMailer < ActionMailer::Base
  default from: "no-reply@walksterapp.com"

  def comment_added
  	    mail(to: "nannigan@nannigans.com",
         subject: "wee haw, the test is working!")
  end
end
