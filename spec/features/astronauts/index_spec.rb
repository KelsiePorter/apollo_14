require 'rails_helper'

RSpec.describe 'astronaut index page', type: :feature do 
  before :each do 
    @astronaut_1 = Astronaut.create(name: "Neil", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create(name: "Buzz", age: 55, job: "Pilot")
    @astronaut_3 = Astronaut.create(name: "Madonna", age: 44, job: "HBIC")
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
end