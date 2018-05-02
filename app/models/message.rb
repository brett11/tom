class Message < MailForm::Base
  attribute :name,            :validate => true
  attribute :email,           :validate => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attribute :phone_number,    :validate => true
  attribute :body,            :validate => true
  attribute :nickname,        :captcha => true  #to catch spam

  def headers
    {
      :subject => "Contact Form",
      :to => "tomfox9235@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
