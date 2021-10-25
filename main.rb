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

  def logic
    temp = true
    while temp
      puts 'Choose a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '0 - Exit'

      num = gets.chomp

      case num
      when '1'
        @books.list_all_books
      when '2'
        @people.list_people
      when '3'
        @people.create_person
      when '4'
        @books.create_book
      when '5'
        @rentals.create_rental(@books.books,@people.people)
      when '6'
        @rentals.list_all_rentals
      when '0'
        temp = false
        p 'exiting'
      end
    end
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
