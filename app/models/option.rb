class Option < ActiveRecord::Base
  belongs_to :level
  has_many :answers
end
