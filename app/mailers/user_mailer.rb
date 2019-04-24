class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
def confirmation_instructions(record, token, opts={})
   mail(to: record.email, subject: 'Welcome to My Awesome Site')
end
end