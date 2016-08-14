class People
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "hi my name is #{@name}"
  end

end


class Student < People

  def learn
    puts "I get it!"
  end

end



class Instructor < People

  def teach
    puts "Everything in Ruby in an object."
  end

end

chris = Instructor.new("Chris")
christina = Student.new("Christina")

chris.greeting
christina.greeting

chris.teach
christina.learn
