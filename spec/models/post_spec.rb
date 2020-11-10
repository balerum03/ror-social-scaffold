require 'rails_helper'

RSpec.describe Post do
  let!(:test_user) { User.create(name: 'Bbosa', email: 'bbosa2009@gmail.com', password: '123') }
  let!(:subject) do
    described_class.new(
      content: 'Test Article/content',
      user_id: test_user.id
    )
  end

  describe Post do
    it 'post belongs to User' do
      test_case = Post.reflect_on_association(:user)
      expect(test_case.macro).to eq(:belongs_to)
    end
    it 'post has many comments' do
      test_case = Post.reflect_on_association(:comments)
      expect(test_case.macro).to eq(:has_many)
    end
    it 'post has many likes' do
      test_case = Post.reflect_on_association(:likes)
      expect(test_case.macro).to eq(:has_many)
    end
  end
end
