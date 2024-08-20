require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:document) }
  end

  describe "Validations" do
    it { should validate_presence_of(:action) }
  end
end
