require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'should create a valid User' do
    expect(user).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:articles) }
  it { should have_many(:memberships) }
end
