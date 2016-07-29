class TransactionMailer < ApplicationMailer

  default from: 'support@garbij.com'

  def receipt_email_buyer(user, pdf)
    @user = user
    # saves PDF to tmp file, which is git ignored
    tmp_path = Rails.root.join('tmp','receipt.pdf')
    File.open(tmp_path, 'wb') do |file|
      file << pdf
    end
    attachments['receipt.pdf'] = File.read("#{Rails.root}/tmp/receipt.pdf")
    mail(to: @user.email, subject: "Print Your Receipt")

  end

  def receipt_email_seller(sell_user, sell_pdf)
    @user = sell_user
    tmp_path = Rails.root.join('tmp', 'sell_receipt.pdf')
    File.open(tmp_path, 'wb') do |file|
      file << sell_pdf
    end
    attachments['sell_receipt.pdf'] = File.read("#{Rails.root}/tmp/sell_receipt")
    mail(to: @user.email, subject: "Congrats, your spot was purchased!")
  end

end
