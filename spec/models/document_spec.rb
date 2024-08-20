require 'rails_helper'

RSpec.describe Document, type: :model do
  describe "Associations" do
    it { should belong_to(:owner) }
    it { should have_many(:annotations) }
    it { should have_many(:comments) }
    it { should have_many(:ndas) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end
end
