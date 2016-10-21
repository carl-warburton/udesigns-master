class TransactionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.received.subject
  #
  def received(email)
    @greeting = "Hi"

    mail(to:email, subject:"This is your receipt")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.response.subject
  #
  def response(email)
    @greeting = "Hi"

    mail(to:email, subject:"You received a payment")
  end
end
