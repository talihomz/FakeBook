require 'rails_helper'

describe Post, type: :model do
  fixtures :posts
  subject { posts(:one) }

  describe 'Validations' do
    describe '#content' do
      it 'is invalid when blank' do
        subject.content = ' ' * 10
        expect(subject).to_not be_valid
      end

      it 'is invalid when longer than 500 characters' do
        subject.content = 'a' * 501
        expect(subject).to_not be_valid
      end

      it 'is valid with proper data' do
        expect(posts(:one)).to be_valid
      end
    end
  end
end
