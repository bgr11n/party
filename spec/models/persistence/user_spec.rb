# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  nickname      :string
#  email         :string
#  source        :string
#  grand         :boolean          default(FALSE)
#  password_salt :string
#  password_hash :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_nickname  (nickname)
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
