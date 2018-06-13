require 'rails_helper'

describe User, type: :model do
  fixtures :users
  subject { users(:one) } 
  # subject { User.new }
  # let(:valid_user) { users(:one) }

  describe 'Validations' do
    describe '#firstname' do
      it 'is invalid when blank' do
        subject.firstname = ' ' * 6
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 50 characters' do
        subject.firstname = 'a' * 51
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(subject).to be_valid
      end
    end

    describe '#lastname' do
      it 'is invalid when blank' do
        subject.lastname = ' ' * 6
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 50 characters' do
        subject.lastname = 'a' * 51
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(users(:one)).to be_valid
      end
    end

    describe '#bio' do
      it 'is invalid when longer than 300 characters' do
        subject.bio = 'a' * 301
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(users(:one)).to be_valid
      end
    end
  end
end
