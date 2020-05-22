require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'should create a valid User' do
    expect(user).to be_valid
  end
end
