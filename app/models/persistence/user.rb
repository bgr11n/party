module Persistence
  class User < ActiveRecord::Base
    validates :nickname, :email, uniqueness: true
    validates :nickname, :email, :source, presence: true
  end
end
