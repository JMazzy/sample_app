# The Micropost model
class Micropost < ActiveRecord::Base
  belongs_to :user
end
