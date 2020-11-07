require 'rails_helper'

RSpec.describe Like do
  let(:test_user1) { User.create(name: 'Example User', email: 'test@example.com', password: 'password') }
  let(:test_post1) { Post.create(content: 'This is a test post', user_id: test_user.id) }
  let(:subject) do
    described_class.new(
      post_id: test_post1.id,
      user_id: test_user1.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end