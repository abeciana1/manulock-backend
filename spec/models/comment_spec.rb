require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:annotation) }
  end

  describe "Validations" do
    it { should validate_presence_of(:content) }
  end
end
