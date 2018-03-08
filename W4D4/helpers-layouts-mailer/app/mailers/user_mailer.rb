class UserMailer < ApplicationMailer
  default from: 'Yangchen Shen<shyangch@gmail.com>'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/session/new'
    mail(to: "#{user.username}<fake_email@gmail.com>", subject: 'Welcome to 99Cats')
  end
end
