require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:membership) { create(:membership) }

  it 'should create a valid Membership' do
    expect(membership).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:group) }
  it { should have_db_index(:user_id) }
  it { should have_db_index(:group_id) }
end
