require 'rails_helper'

RSpec.describe Annotation, type: :model do
  describe "Associations" do
    it { should belong_to(:document) }
    it { should have_many(:comments) }
  end

  describe "Validations" do
    it { should validate_presence_of(:page_number) }
    it { should validate_presence_of(:selected_text) }
    it { should validate_presence_of(:annotation_type) }
  end
end
