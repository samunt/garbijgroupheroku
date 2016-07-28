class TransactionMailer < ApplicationMailer

  default from: 'support@garbij.com'

  def receipt_email(user)
    @user = user
    attachments['receipt.pdf'] = File.read("#{Rails.root}/tmp/receipt.pdf")
    mail(to: @user.email, subject: "Print Your Receipt")
  end
end
