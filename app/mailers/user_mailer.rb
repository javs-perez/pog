class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

   def document_upload_notification(document )
    @user = document.property.user 
    @document = document
    mail(to: @user.email, subject: 'A new document uploaded on property')
  end

end
