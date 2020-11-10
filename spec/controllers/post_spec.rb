# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Post, type: :model do
  User.delete_all
  Post.delete_all
  let!(:test_user1) { User.create(email: 'test2@test.com', name: 'Adan', gravatar_url: 'image_url', password: '20201109') }
  let!(:test_post1) { Post.create(content: 'this is a test post', user_id: test_user1.id) }
  let!(:test_post2) { Post.create(content: nil, user_id: nil) }

  it 'checks if a post can be saved' do
    expect(test_post2).to be_invalid
  end

  it 'checks if a post can be saved' do
    expect(test_post1).to be_valid
  end
end
# rubocop: enable Layout/LineLength
