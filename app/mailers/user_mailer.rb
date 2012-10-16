class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)  
  		@user = user
  		@url = "http//:www.lacasitadelastorrejas.org"	
  		mail(:to => user.email, :subject => "Registered", :from => "info@lacasitadeastorrejas.org")  
  end 
end
