module Persistence
  class User < ActiveRecord::Base
    validates :nickname, :email, uniqueness: true
    validates :nickname, :email, :source, presence: true
  end
end

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
