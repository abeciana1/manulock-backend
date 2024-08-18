require 'rails_helper'

RSpec.describe Email, type: :model do
  describe "Associations" do
    it { should belong_to :user }
    it { should have_many(:email_events) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:sent_at) }
  end
end
