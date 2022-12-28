require 'rails_helper'

RSpec.describe 'astronaut index page', type: :feature do 
  before :each do 
    @astronaut_1 = Astronaut.create(name: "Neil", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create(name: "Buzz", age: 55, job: "Pilot")
    @astronaut_3 = Astronaut.create(name: "Madonna", age: 44, job: "HBIC")

    @mission_1 = Mission.create(title: "Apollo 13", time_in_space: 15)
    @mission_2 = Mission.create(title: "Capricorn 4", time_in_space: 22)
    @mission_3 = Mission.create(title: "Gemini 7", time_in_space: 5)

    @mission_1.astronauts << @astronaut_1
    @mission_1.astronauts << @astronaut_2
    @mission_1.astronauts << @astronaut_3

    @mission_2.astronauts << @astronaut_1
    @mission_2.astronauts << @astronaut_3

    @mission_3.astronauts << @astronaut_2
    @mission_3.astronauts << @astronaut_3
  end

  it 'displays all astronauts and their attributes' do 
    visit '/astronauts'

    expect(page).to have_content("Name: #{@astronaut_1.name}")
    expect(page).to have_content("Age: #{@astronaut_1.age}")
    expect(page).to have_content("Job: #{@astronaut_1.job}")
    expect(page).to have_content("Name: #{@astronaut_2.name}")
    expect(page).to have_content("Age: #{@astronaut_2.age}")
    expect(page).to have_content("Job: #{@astronaut_2.job}")
    expect(page).to have_content("Name: #{@astronaut_3.name}")
    expect(page).to have_content("Age: #{@astronaut_3.age}")
    expect(page).to have_content("Job: #{@astronaut_3.job}")
  end

  it 'displays the average age of all astronauts' do 
    visit '/astronauts'

    expect(page).to have_content("Average Astronaut Age: 45")
  end

  it 'displays each astronauts space missions in alphabetical order' do 
    visit '/astronauts'

    within("section#astronaut-#{@astronaut_1.id}") do
      expect(page).to have_content("#{@mission_1.title}")
      expect(page).to have_content("#{@mission_2.title}")
      expect(page).not_to have_content("#{@mission_3.title}")
    end

    within("section#astronaut-#{@astronaut_2.id}") do
      expect(page).to have_content("#{@mission_1.title}")
      expect(page).to have_content("#{@mission_3.title}")
      expect(page).not_to have_content("#{@mission_2.title}")
    end

    within("section#astronaut-#{@astronaut_3.id}") do
      expect(page).to have_content("#{@mission_1.title}")
      expect(page).to have_content("#{@mission_2.title}")
      expect(page).to have_content("#{@mission_3.title}")
    end
  end

  it 'displays the total time in space for each astronaut' do 
    visit '/astronauts'

    within("section#astronaut-#{@astronaut_1.id}") do
      expect(page).to have_content("Total Time in Space: 37 days")
    end

    within("section#astronaut-#{@astronaut_2.id}") do
      expect(page).to have_content("Total Time in Space: 20 days")
    end

    within("section#astronaut-#{@astronaut_3.id}") do
      expect(page).to have_content("Total Time in Space: 42 days")
    end
  end
end