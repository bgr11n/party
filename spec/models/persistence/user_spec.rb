# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  grand      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nickname   :string           not null
#

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
