require 'rails_helper'

RSpec.describe User do
  let(:subject) do
    described_class.new(
      name: 'bbosa',
      email: 'bbosa2009@gmail.com',
      password: '123456'
    )
  end

  describe 'presence of all fields on User' do
    it 'validates the presence of name' do
      expect(subject.errors[:name]).to_not include("can't be black")
    end
    it 'validates the presence of email' do
      expect(subject.errors[:email]).to_not include("can't be black")
    end
    it 'validates the presence of password' do
      expect(subject.errors[:password]).to_not include("can't be black")
    end
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end
  end
  describe 'Associations', type: :model do
    it 'user has many posts' do
      test_case = User.reflect_on_association(:posts)
      expect(test_case.macro).to eq(:has_many)
    end
    it 'user has many comments' do
      test_case = User.reflect_on_association(:comments)
      expect(test_case.macro).to eq(:has_many)
    end
    it 'user has many likes' do
      test_case = User.reflect_on_association(:likes)
      expect(test_case.macro).to eq(:has_many)
    end
    it 'user has many friendships' do
      test_case = User.reflect_on_association(:friendships)
      expect(test_case.macro).to eq(:has_many)
    end
    it 'user has many inverse friendships' do
      test_case = User.reflect_on_association(:inverse_friendships)
      expect(test_case.macro).to eq(:has_many)
    end
  end
end
