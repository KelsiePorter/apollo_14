require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'instance methods' do 
    it '#alpha_missions' do 
      @astronaut_1 = Astronaut.create(name: "Neil", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create(name: "Buzz", age: 55, job: "Pilot")
      @astronaut_3 = Astronaut.create(name: "Madonna", age: 44, job: "HBIC")

      @mission_1 = Mission.create(title: "Apollo 13", time_in_space: 15)
      @mission_2 = Mission.create(title: "Capricorn 4", time_in_space: 22)
      @mission_3 = Mission.create(title: "Gemini 7", time_in_space: 5)

      @mission_3.astronauts << @astronaut_2
      @mission_3.astronauts << @astronaut_3

      @mission_1.astronauts << @astronaut_1
      @mission_1.astronauts << @astronaut_2
      @mission_1.astronauts << @astronaut_3

      @mission_2.astronauts << @astronaut_1
      @mission_2.astronauts << @astronaut_3

      expect(@astronaut_1.alpha_missions).to eq(["Apollo 13", "Capricorn 4"])
      expect(@astronaut_2.alpha_missions).to eq(["Apollo 13", "Gemini 7"])
      expect(@astronaut_3.alpha_missions).to eq(["Apollo 13", "Capricorn 4", "Gemini 7"])
    end
  end
end
