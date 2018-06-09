require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  
  it "has a unique username" do
    user2 = build(:user, email: "bob@gmail.com")
    expect(user2).to_not be_valid
  end
  
  it "has a unique email" do
    user2 = build(:user, username: "Bob")
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a username" do 
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is valid without an organization" do
    user2 = build(:user, username: "Test", email: "test@test.com", organization: nil)
    expect(user2).to be_valid
  end

  it "is not valid without an name" do
    user2 = build(:user, name: nil)
    expect(user2).to_not be_valid
  end

  it "has a password with at least 6 characters" do
    user2 = build(:user, password: "blah")
    expect(user2).to_not be_valid
  end
  DatabaseCleaner.clean
end
