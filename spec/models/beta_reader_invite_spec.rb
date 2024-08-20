require 'rails_helper'

RSpec.describe BetaReaderInvite, type: :model do
  describe "Associations" do
    it { should belong_to(:inviter) }
    it { should belong_to(:document) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:document_id) }
    it { should validate_presence_of(:status) }
  end
end
