require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it 'has a valid factory' do
    expect(build(:invitation)).to be_valid
  end

  it 'is valid without email' do
    expect(build(:invitation, email: nil)).to_not be_valid
  end
end
