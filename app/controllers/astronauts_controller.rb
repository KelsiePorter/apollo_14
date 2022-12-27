class AstronautsController < ApplicationController 

  def index
    @astronauts = Astronaut.all

    @average_astronaut_age = @astronauts.average(:age).round

  end
end 