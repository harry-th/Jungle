Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_51M4o8iCAqcunvJK6h4gtP30Mmci0Z8kuePqp4dk0CixZY8d51ZhpaCmmE0bjjTSTA1J3Qpgcny3TSCgkXPvhwdHB00pFZ2iZQT'],
  :secret_key      => ENV['sk_test_51M4o8iCAqcunvJK6WSzAFgyyxFHgDvduTROQN1vYqigh820rGdXmSOtiOfl0hESF0OUrsAUqVi5WprN3Q22LHC0x00pLF6tXqY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
