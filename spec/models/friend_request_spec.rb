require 'rails_helper'

describe FriendRequest, type: :model do
  fixtures :friend_requests
  subject { friend_requests(:one) }

  describe 'Validations' do
    describe '#status' do
      it 'is invalid when blank' do
        subject.status = ' ' * 3
        expect(subject).to_not be_valid
      end

      it 'is invalid when out of range' do
        invalid_statuses = [ 4,5,-1 ]

        invalid_statuses.each do |status|
          subject.status = status
          expect(subject).to_not be_valid
        end
      end

      it 'is invalid when in range' do
        valid_statuses = [ 0,1,2 ]

        valid_statuses.each do |status|
          subject.status = status
          expect(subject).to be_valid
        end
      end
    end
  end

  describe 'Associations' do
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end