require 'rails_helper'

RSpec.describe User do
  let(:subject) do
    described_class.new(
      name: 'bbosa',
      email: 'bbosa2009@gmail.com',
      password: '123'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end
  end
  describe 'Associations', type: :model do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:friendships) }
    it { is_expected.to have_many(:inverse_friendships) }
  end
end
