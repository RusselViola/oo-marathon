class ZooAtCapacity < StandardError
end

class Zoo

  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = Array.new(10){Cage.new}
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    @opening_date <= date && date <= @closing_date
  end

  def add_animal(animal)
    # @cages[0].animal = animal
    # @cages.each do |cage|
    #   if cage.empty?
    #     cage.animal = animal
    #     return
    #   end
    # end
    # raise ZooAtCapacity
    raise ZooAtCapacity if @cages.none? {|cage| cage.empty?}
    @cages.find {|cage| cage.empty?}.animal = animal
  end


  def visit
    greeting = ""
    @employees.each do |employee|
       greeting += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    greeting
  end







end
