require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Users' do
    it 'creates a valid user' do
      @user = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      
      expect(@user).to be_valid      
    end
    
    it 'should have an email' do
      @user = User.create(name: "Marty", email: nil, password: "delorean", password_confirmation: "delorean")
      
      expect(@user).to_not be_valid
    end

    it 'should have a unique email' do
      @user_1 = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      @user_2 = User.create(name: "Marty", email: "marty@mcfly.tech", password: "delorean", password_confirmation: "delorean")
      @user_3 = User.create(name: "Marty", email: "MARTY@mcfly.tech", password: "delorean", password_confirmation: "delorean") 

      expect(@user_1).to be_valid
      expect(@user_2).to_not be_valid
      expect(@user_3).to_not be_valid
    end

    it 'should be created with password and confirmation' do 
      @user_1 = User.create(name: "Marty", email: nil, password: nil, password_confirmation: "delorean")
      @user_2 = User.create(name: "Marty", email: nil, password: "delorean", password_confirmation: nil)
      
      expect(@user_1).to_not be_valid
      expect(@user_2).to_not be_valid
    end

    it 'password should match password_confirmation' do
      @user = User.create(name: "Marty", email: "marty@mcfly.tech", password: "Delorean", password_confirmation: "delorean")
      
      expect(@user).to_not be_valid
    end
    
  end

end
