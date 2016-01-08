require 'rails_helper'

RSpec.describe Persistence::UserIdentity, type: :model do
  let(:identity) { create(:identity_auth) }

  it { expect(identity).to be_valid }

  describe 'validations' do
    it { expect(identity).to validate_inclusion_of(:source).in_array(::Persistence::UserIdentity::SOURCES.map(&:to_s)) }
  end

  describe 'public instance methods' do
    it { expect(identity).to respond_to :has_password? }

    it { expect(identity.has_password?('correct_password')).to eq(true) }
    it { expect(identity.has_password?('wrong_password')).to eq(false) }

    it { expect(identity).to respond_to :from_plain? }
    it { expect(identity).to respond_to :from_twitch? }

    it { expect(identity.from_plain?).to eq(true) }
    it { expect(identity.from_twitch?).to eq(false) }
  end
end
