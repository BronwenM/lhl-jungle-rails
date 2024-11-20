require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Users' do
    before do
      @user = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      @user_2 = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      @user_3 = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean") 

    end

    it 'creates a valid user' do
      # @user = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      
      expect(@user).to be_valid      
    end
    
    it 'should have an email' do
      # @user = User.create(name: "Marty", email: nil, password: "delorean", password_confirmation: "delorean")
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'should have a unique email' do
      @user_2.email = "marty@mcfly.tech"
      @user_3.email = "MARTY@mcfly.tech"

      expect(@user).to be_valid
      expect(@user_2).to_not be_valid
      expect(@user_3).to_not be_valid
    end

    it 'should be created with password and confirmation' do 
      @user.password_confirmation = nil
      @user_2.password_confirmation = nil

      expect(@user).to_not be_valid
      expect(@user_2).to_not be_valid
    end

    it 'password should match password_confirmation' do
      @user.password = "Delorean"
      @user.password_confirmation = "delorean"

      expect(@user).to_not be_valid
    end

    it 'password should have at least 6 characters' do
      @user.password = "del"
      
      expect(@user).to_not be_valid
    end
    
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(name: "Marty", email: "mArty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
    end

    it 'should log in a valid user' do
      expect(User.authenticate_with_credentials("marty@mcfly.tech", "delorean")).to eq(@user)
    end

    it 'should log in a valid user where the email has extra spaces' do
      expect(User.authenticate_with_credentials("  marty@mcfly.tech  ", "delorean")).to eq(@user)
    end

    it 'should log in a valid user where the email has mixed case' do
      expect(User.authenticate_with_credentials("  maRTy@mcfly.tech  ", "delorean")).to eq(@user)
    end
  end

end
