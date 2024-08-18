require 'rails_helper'

RSpec.describe Subscription, type: :model do
  before(:all) do
    @starter_subscription = create(:subscription)
    @premium_subscription = create(:subscription, :premium)
    @pro_subscription = create(:subscription, :pro)
  end
  
  describe "Validations" do
    it { should validate_presence_of(:plan) }
    it { should validate_numericality_of(:documents_remaining) }
    it { should validate_numericality_of(:invites_remaining) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end

  it "starter subscription is valid" do
    expect(@starter_subscription).to be_valid
  end

  it "premium subscription is valid" do
    expect(@premium_subscription).to be_valid
  end

  it "pro subscription is valid" do
    expect(@pro_subscription).to be_valid
  end

end
