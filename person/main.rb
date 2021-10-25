# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength
require_relative 'student'
require_relative 'teacher'

class AddPersons
  attr_reader :people

  def initialize
    @people = []
  end

  def list_people
    puts 'No student or teacher added' if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name},
       ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
  end

  def create_person
    print 'Do you want to create a student (1)
    or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      print 'Has parent permission? [y/n]: '
      parent_permission = gets.chomp == 'y'

      student = Student.new(age, name, parent_permission)
      @people << student
    when '2'
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end
    puts 'Person created successfully'
    puts ''
  end
end

# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
