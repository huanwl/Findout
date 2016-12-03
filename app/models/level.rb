class Level < ActiveRecord::Base
  has_many :options
  has_many :tips
  has_many :answers

  enum degree: [:low, :mid, :high]

  def self.getDegreeName(degree)
    case degree
    when "low"
         "明顯"
    when "mid"
         "中等"
    when "high"
         "隱性"
    else
         "null"
    end
  end
end
