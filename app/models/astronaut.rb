class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def alpha_missions 
    missions.order(:title).pluck(:title)
  end

  def total_time
    missions.sum(:time_in_space)
  end
end
