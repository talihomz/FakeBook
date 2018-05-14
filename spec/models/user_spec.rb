require 'rails_helper'

describe User, type: :model do
  fixtures :users
  subject { User.new }

  describe 'Validations' do
    describe '#first_name' do
      it 'is invalid when blank' do
        subject.first_name = ' ' * 6
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 50 characters' do
        subject.first_name = 'a' * 51
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(users(:one)).to be_valid
      end
    end

    describe '#last_name' do
      it 'is invalid when blank' do
        subject.last_name = ' ' * 6
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 50 characters' do
        subject.last_name = 'a' * 51
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(users(:one)).to be_valid
      end
    end

    describe '#bio' do
      it 'is invalid when blank' do
        subject.bio = ' ' * 6
        expect(subject).to_not be_valid
      end

      it 'is invalid when shorted than 10 characters' do
        subject.bio = 'a' * 8
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 300 characters' do
        subject.bio = 'a' * 301
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(users(:one)).to be_valid
      end
    end
  end

  describe 'Associations' do
    it 'has many posts' do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end

    it 'has many notifications' do
      assc = described_class.reflect_on_association(:notifications)
      expect(assc.macro).to eq :has_many
    end

    it 'has many friends' do
      assc = described_class.reflect_on_association(:friends)
      expect(assc.macro).to eq :has_many
    end
  end
end
