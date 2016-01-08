module Persistence
  class User < ActiveRecord::Base
    validates :nickname, uniqueness: true
    validates :nickname, presence: true

    has_many :user_identities, dependent: :destroy

    # alias_method :grand?, :grand
  end
end

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
