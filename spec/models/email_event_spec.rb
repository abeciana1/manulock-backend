require 'rails_helper'

RSpec.describe EmailEvent, type: :model do
  describe "Associations" do
    it { should belong_to(:email) }
  end

  describe "Validations" do
    it { should validate_presence_of(:event_type) }
  end
end
