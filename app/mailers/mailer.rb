class Mailer < ApplicationMailer
    default from: "GPCFGrants@gmail.com"
    # should send an email to all users when an application is coming due.
    def reminder_email(program)
       @program = program
       @users = User.all
       @users.each do |user|
           mail(to: user.email, subject: @program.title + 'application is coming due')
       end
    end
end
