class UserNotifierMailer < ApplicationMailer

  default from: 'info@mir-blog.herokuapp.com'

  def welcome_user(user)
    @user = user
    @url = 'https://mir-blog.herokuapp.com'

    mail(to: @user.email, subject: 'Bienvenido al blog de MIR')
  end

  def new_post_mail(user, post)
    @user = user
    @post = post

    mail(to: @user.email, subject: 'Un nuevo post ha sido creado en MIR Blog')
  end

end
