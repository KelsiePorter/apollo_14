require 'rails_helper'

describe AstronautMission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :astronaut_id }
    it { should validate_presence_of :mission_id }
  end

  describe 'Relationships' do
    it { should belong_to :astronaut}
    it { should belong_to :mission}
  end
end