require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a username, password confirmation, and password' do
    user = build(:user, password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a username' do
    user = build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a first_name' do
    user = build(:user, first_name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a last_name' do
    user = build(:user, last_name: nil)
    expect(user).not_to be_valid
  end

  it 'hashes the password using BCrypt' do
    user = create(:user, password: 'password')

    expect(user.password_digest).not_to eq 'password'

    expect(BCrypt::Password.new(user.password_digest)).to be_truthy

    expect(BCrypt::Password.new(user.password_digest).is_password?('password')).to be true
  end
end
