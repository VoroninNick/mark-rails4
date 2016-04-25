class UserMailer < ActionMailer::Base

  def email_us(contact_data)
    #if name.is_a?(ActiveRecord::Base)
    #@name = name
    #@body[:question]  = question
    #end
    @contact = contact_data

    setup_email
    #receiver_emails = ["p.korenev@voroninstudio.eu"]
    # mail(to: receiver_emails,
    #      template_path: "action_mailer/user",
    #      template: "email_us",
    #      subject: "Already rendered!")



  end

  protected
  def setup_email
    @recipients  = ["p.korenev@voroninstudio.eu"]
    @from        = "support@voroninstudio.eu"
    @sent_on     = Time.now
    @to = ["marketing.tryslony@gmail.com", "lex65@ukr.net", "plandzuev_viktor@mail.ru", "yyn@mail.ru"]

  end

end