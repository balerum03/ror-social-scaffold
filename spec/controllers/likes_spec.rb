# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Like, type: :model do
  User.delete_all
  Post.delete_all
  let!(:test_user1) { User.create(email: 'bbosa2009@gmail.com', name: 'bmuhamood', gravatar_url: 'img_url', password: '20201109') }
  let!(:test_post1) { Post.create(content: 'Test post', user_id: test_user1.id) }
  let!(:test_like1) { Like.create(post_id: nil, user_id: nil) }
  let!(:test_like2) { Like.create(post_id: test_post1.id, user_id: test_user1.id) }

  it 'Checks for a user to exist to create a like.' do
    expect(test_like1).to be_invalid
  end

  it 'Cheks if the users does exist, and allows the like' do
    expect(test_like2).to be_valid
  end
end
# rubocop: enable Layout/LineLength
