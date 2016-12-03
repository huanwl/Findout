class Level < ActiveRecord::Base
  has_many :options
  has_many :tips
  has_many :answers
end
