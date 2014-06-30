class Tab < ActiveRecord::Base
  has_many :assignments
  has_one :user
end
