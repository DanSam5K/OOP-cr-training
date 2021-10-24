require_relative './person'

# rubocop:disable Style/OptionalBooleanParameter
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
# rubocop:enable Style/OptionalBooleanParameter
