class TransactionMailer < ApplicationMailer

  default from: 'support@garbij.com'

  def receipt_email(user, pdf)
    @user = user
    tmp_path = Rails.root.join('tmp','receipt.pdf')
    File.open(tmp_path, 'wb') do |file|
      file << pdf
    end

    attachments['receipt.pdf'] = File.read("#{Rails.root}/tmp/receipt.pdf")
    mail(to: @user.email, subject: "Print Your Receipt")

  end
end
