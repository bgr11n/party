module Persistence
  class Track < ActiveRecord::Base
    validates :uri, uniqueness: true
    validates :uri, :title, :thumbnail, :duration, presence: true
  end
end

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
