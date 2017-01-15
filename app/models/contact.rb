class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A[^@\s]+@[^@\s]+\z/
  attribute :message,   :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers 
  	{
      :subject => "Hockeytut Contact Form",
      :to => "kult404@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end