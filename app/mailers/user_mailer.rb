class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

   def document_upload_notification(document)
    @document = document
    mail(to: @document.property.user.email, subject: 'A new document uploaded on property')
  end

end
