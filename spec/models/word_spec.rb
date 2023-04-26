require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:value) }
    it { is_expected.to have_db_column(:language) }
  end

  describe 'vadations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:language) }

    subject { described_class.new }

    it "is valid with valid attributes 1" do
      subject.value = "Anything"
      subject.language = "Anything"

      expect(subject).to be_valid
    end

    it "is valid with valid attributes 2" do
      word = FactoryBot.build(:word)
      expect(word).to be_valid
    end

    it "is not valid without a language" do
      word = FactoryBot.build(:word, language: nil)
      expect(word).to_not be_valid
    end
  end
end
