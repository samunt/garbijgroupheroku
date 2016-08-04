class TransactionMailer < ApplicationMailer

  # email send from this address
  default from: 'support@garbij.com'

  # logic for mail sent to buy_user
  def receipt_email_buyer(user, pdf)
    # buy_user passed into function in transactions controller
    @user = user
    # saves PDF to tmp file, which is git ignored
    tmp_path = Rails.root.join('tmp','receipt.pdf')
    File.open(tmp_path, 'wb') do |file|
      file << pdf
    end
    # adds PDF as attachment to email
    attachments['receipt.pdf'] = File.read("#{Rails.root}/tmp/receipt.pdf")
    mail(to: @user.email, subject: "Print Your Receipt")

  end

  # logic for mail sent to sell_user
  def receipt_email_seller(sell_user, sell_pdf)
    # sell_user passed into receipt_email_seller function in transactions controller
    @user = sell_user
    # save sell_receipt into tmp directory
    tmp_path = Rails.root.join('tmp', 'sell_receipt.pdf')
    File.open(tmp_path, 'wb') do |file|
      file << sell_pdf
    end
    # attach PDF to email
    attachments['sell_receipt.pdf'] = File.read("#{Rails.root}/tmp/sell_receipt.pdf")
    mail(to: @user.email, subject: "Congrats, your spot was purchased!")
  end

end
