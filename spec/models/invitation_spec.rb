require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it 'has a valid factory' do
    expect(build(:invitation)).to be_valid
  end

  it 'is valid without email' do
    expect(build(:invitation, email: nil)).to_not be_valid
  end

  it 'is valid without wrong email' do
    expect(build(:invitation, email: 'test@gmail.com')).to_not be_valid
  end

  it 'is valid with existing email' do
    expect(create(:invitation)).to be_valid
    expect(build(:invitation)).to_not be_valid
  end

  it 'is valid with existing user' do
    expect(create(:user)).to be_valid
    expect(build(:invitation)).to_not be_valid
  end

end
