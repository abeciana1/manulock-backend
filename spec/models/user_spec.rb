require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before(:each) do
    puts "start of before all"
    @reviewer_user = create(:user, :reviewer, :with_inviter)
    @inviter_user = create(:user, :inviter)
    puts "is running"
  end
  
  describe "Validates presence of first name, last name, email, and role" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
  end

  it 'creates a user with the inviter role' do
    expect(@inviter_user.role).to eq('inviter')
    expect(@inviter_user).to be_valid
  end

  it "creates a user with the reviewer role" do
    expect(@reviewer_user.role).to eq('reviewer')
    expect(@reviewer_user).to be_valid
  end

  it "Reviewer user has an invited by id" do
    expect(@reviewer_user.invited_by_id).not_to be_nil
  end

  describe "Associations" do
    it { should have_one(:subscription) }
    it { should have_many(:invited_users) }
    it { should have_many(:documents) }
    it { should have_many(:beta_reader_invites) }
    it { should have_many(:received_invites) }
    it { should have_many(:comments) }
    it { should have_many(:ndas) }
  end

end
