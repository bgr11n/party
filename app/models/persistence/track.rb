module Persistence
  class Track < ActiveRecord::Base
    validates :uri, uniqueness: true
    validates :uri, :title, :thumbnail, :duration, presence: true
  end
end
