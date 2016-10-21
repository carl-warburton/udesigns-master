# Preview all emails at http://localhost:3000/rails/mailers/transaction_mailer
class TransactionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transaction_mailer/received
  def received
    TransactionMailer.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/transaction_mailer/response
  def response
    TransactionMailer.response
  end

end
