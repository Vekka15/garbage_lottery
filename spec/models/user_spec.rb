require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is valid with prograils email and password' do
    expect(build(:user)).to be_valid
  end

  it 'is valid without email' do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it 'is not valid with wrong email' do
    expect(build(:user, email: 'test@gmail.com')).to_not be_valid
  end

  it 'is not valid with existing user' do
    expect(create(:user)).to be_valid
    expect(build(:user)).to_not be_valid
  end
end
