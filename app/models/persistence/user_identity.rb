module Persistence
  class UserIdentity < ActiveRecord::Base
    SOURCES = [:plain, :twitch]

    belongs_to :user

    validates :email, :source, presence: true
    validates :email, uniqueness: true
    validates :source, inclusion: { in: SOURCES.map(&:to_s) }
  end
end

# == Schema Information
#
# Table name: user_identities
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  email         :string           not null
#  source        :string           not null
#  data          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  password_salt :string
#  password_hash :string
#
# Indexes
#
#  index_user_identities_on_email    (email)
#  index_user_identities_on_user_id  (user_id)
#
