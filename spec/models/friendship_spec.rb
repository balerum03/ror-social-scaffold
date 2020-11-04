# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let!(:test_user1) { User.create(name: 'Adan', email: 'test@test.com', password: 'hellothere', gravatar_url: 'hellothere') }
  let!(:test_user2) { User.create(name: 'Bbosa', email: 'test2@test.com', password: 'hellothere', gravatar_url: 'hellothere1') }
  it 'Friendship is invalid when user_id or friend_id is not given' do
    friendship_test = Friendship.create(user_id: nil, friend_id: nil, confirmed: true)
    expect(friendship_test).to be_invalid
  end
  it "Friendship is valid when it's given both user_ids" do
    friendship_test = Friendship.create(user_id: test_user1.id, friend_id: test_user2.id, confirmed: true)
    expect(friendship_test).to be_valid
  end
end
# rubocop: enable Layout/LineLength
