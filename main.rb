# rubocop:disable all

require_relative './person/person'
require_relative './person/main'
require_relative './book/book'
require_relative './book/main'
require_relative './person/teacher'
require_relative './person/student'
require_relative './rental/rental'
require_relative './rental/main'

class App
  attr_accessor :books, :people

  def initialize(people = [], books = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end


end

def main
  people = AddPersons.new
  books = AddBook.new
  rentals = AddRental.new
  app = App.new(people, books, rentals)
  app.logic
end

main
# rubocop:enable all
