# rubocop:disable all

require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @books and @books.each do |book|
      puts "#{book.title} - #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "Name: #{person.name},Age: #{person.age}"
    end
  end

  def create_a_person
    puts 'student (1) or teacher (2)?'
    num = gets.chomp

    case num
    when '1'
      p 'Age: '
      age = gets.chomp

      p 'Name: '
      name = gets.chomp

      p 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      permission = permission.downcase == 'y'

      @people.push(Student.new(age, name, permission))

      puts 'student created successfully'
    when '2'
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)

      puts 'Teacher created successfully'

    else
      puts 'invalid selection'

      nil
    end
  end

  def create_a_book
    p 'add title'
    title = gets.chomp

    print 'add author name'
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, _index|
      puts "Name: #{person.name}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_a_given_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

def main
  app = App.new

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
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_a_person
    when '4'
      app.create_a_book
    when '5'
      app.create_a_rental
    when '6'
      app.list_all_rentals_for_a_given_person_id
    when '0'
      temp = false
      p 'exiting'
    end
  end
end

main
# rubocop:enable all
