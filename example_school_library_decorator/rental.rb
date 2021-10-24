# rubocop:disable all

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.psuh(self)
  end
end
