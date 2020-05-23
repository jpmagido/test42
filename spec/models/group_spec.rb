require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { create(:group) }

  it 'should create a valid Group' do
    expect(group).to be_valid
  end

  it { should validate_presence_of(:title) }
  it { should have_many(:memberships) }
  it { should validate_length_of(:title).is_at_least(3).on(%i[update create]) }
end
