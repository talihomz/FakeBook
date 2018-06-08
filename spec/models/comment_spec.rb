require 'rails_helper'

describe Comment, type: :model do
  fixtures :comments
  subject { comments(:one) }

  describe 'Validations' do
    describe '#content' do
      it 'is invalid when blank' do
        subject.content = ' ' * 10
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 300 characters' do
        subject.content = 'a' * 301
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(subject).to be_valid
      end
    end
  end
end
