require 'rails_helper'

RSpec.describe Persistence::User, type: :model do
  let(:user) { create(:user) }

  it { expect(user).to be_valid }

  describe 'validations' do
    it { expect(user).to validate_presence_of(:nickname) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:source) }
    it { expect(user).to validate_uniqueness_of(:nickname) }
    it { expect(user).to validate_uniqueness_of(:email) }
  end
end
