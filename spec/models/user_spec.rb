require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  it "should pass with the necessary information" do
  user = User.create!( {:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password'})
  expect(user).to be_a User
  end
  it "should fail when password confirmation doesn't match" do
   expect { User.create!({:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password2'})}.to raise_error
  end
  it "should fail when password password is in use" do
    User.create!({:first_name => 'jimbo',
   :last_name => 'bimbo',
   :email => 'jimbo@bimbo.com',
   :password => 'password',
   :password_confirmation => 'password'})

   expect { User.create!({:first_name => 'jimbo',
   :last_name => 'bimbo',
   :email => 'jimbo@bimbo.com',
   :password => 'password',
   :password_confirmation => 'password'})}.to raise_error
   end
   it "should not matter the case for unique emails" do
    User.create!({:first_name => 'jimbo',
   :last_name => 'bimbo',
   :email => 'jimbo@bimbo.com',
   :password => 'password',
   :password_confirmation => 'password'})

   expect { User.create!({:first_name => 'jimbo',
   :last_name => 'bimbo',
   :email => 'JIMBO@BIMBO.com',
   :password => 'password',
   :password_confirmation => 'password'})}.to raise_error
   end

   it "shouldn't pass without name" do
   expect { User.create!({:first_name => nil,
   :last_name => 'bimbo',
   :email => 'jimbo@bimbo.com',
   :password => 'password',
   :password_confirmation => 'password'})}.to raise_error
  end
 it "shouldn't pass without email" do
  expect { User.create!({:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => nil,
  :password => 'password',
  :password_confirmation => 'password'})}.to raise_error
 end
 it "shouldn't pass without last name" do
 expect { User.create!({:first_name => 'jimbo',
 :last_name => nil,
 :email => 'jimbo@bimbo.com',
 :password => 'password',
 :password_confirmation => 'password'})}.to raise_error
end
it "shouldn't pass with a password that is too short" do
  expect { User.create!({:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'pass',
  :password_confirmation => 'pass'})}.to raise_error
 end
end
describe '.authenticate_with_credentials' do
  it 'should pass with correct information' do
    user = User.create!( {:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password'})
 expect(user).to eq(User.authenticate_with_credentials("jimbo@bimbo.com", "password"))
  end
  it 'should fail with incorrect information' do
    user = User.create!( {:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password'})
 expect(user).not_to eq(User.authenticate_with_credentials("jambo@bambo.com", "password"))
  end
  it 'should pass with correct information despite some spaces' do
    user = User.create!( {:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimbo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password'})
 expect(user).to eq(User.authenticate_with_credentials("  jimbo@bimbo.com", "password"))
  end
  it 'should pass with correct information despite email case' do
    user = User.create!( {:first_name => 'jimbo',
  :last_name => 'bimbo',
  :email => 'jimBo@bimbo.com',
  :password => 'password',
  :password_confirmation => 'password'})
 expect(user).to eq(User.authenticate_with_credentials("Jimbo@biMbo.com", "password"))
  end
end
end
