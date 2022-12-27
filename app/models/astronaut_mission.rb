class AstronautMission < ApplicationRecord
  validates_presence_of :astronaut_id, :mission_id

  belongs_to :astronaut 
  belongs_to :mission
end
