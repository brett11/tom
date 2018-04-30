class Message < MailForm::Base
  attribute :name,            :validate => true
  attribute :phone_number,    :validate => true
  attribute :body,            :validate => true
  attribute :nickname,        :captcha => true  #to catch spam

  def headers
    {
      :subject => "Contact Form",
      :to => "tomfox9235@gmail.com",
      :from => %("#{name}" <#{phone_number}>)
    }
  end
end
