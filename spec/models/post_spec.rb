require 'rails_helper'

RSpec.describe Post do
  let(:test_user) { User.create(name: 'Bbosa', email: 'bbosa2009@gmail.com', password: '123') }
  let(:subject) do
    described_class.new(
      content: 'Test Article/content',
      user_id: test_user.id
    )
  end

  describe 'Associations', type: :model do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end
end