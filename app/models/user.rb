class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) =?', email.strip.downcase).first
    pp user, 'hello'
    if user && user.authenticate(password)
        user
    else
        nil
    end
  end
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end
