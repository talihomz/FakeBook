require 'rails_helper'

describe Notification, type: :model do
  fixtures :notifications
  subject { comments(:one) }

  describe 'Validations' do
    describe '#activity' do
      it 'is invalid when blank' do
        subject.activity = ' ' * 10
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'Associations' do
    it 'belongs to activity' do
      assc = described_class.reflect_on_association(:activity)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
