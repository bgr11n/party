# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  uri        :string
#  title      :string
#  thumbnail  :string
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tracks_on_uri  (uri)
#

require 'rails_helper'

RSpec.describe Persistence::Track, type: :model do
  let(:track) { create(:track) }

  it { expect(track).to be_valid }

  describe 'validations' do
    it { expect(track).to validate_presence_of(:uri) }
    it { expect(track).to validate_presence_of(:title) }
    it { expect(track).to validate_presence_of(:thumbnail) }
    it { expect(track).to validate_presence_of(:duration) }
    it { expect(track).to validate_uniqueness_of(:uri) }
  end
end
