require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }

  it 'should create a valid Article' do
    expect(article).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_db_index(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(3).on(%i[update create]) }
  it { should validate_length_of(:content).is_at_least(10).on(%i[update create]) }
end
