Rails.configuration.stripe = {
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key      => ENV['SECRET_KEY']
  :publishable_key => 'pk_test_bQawjwGIcWIWv9OoU9Drg0KS',
  :secret_key  => 'sk_test_PewmULzxhxbepHBu1nQw6l6D'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
