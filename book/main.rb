require_relative 'book'

class AddBook
  def initialize
    @books = []
  end

  def list_all_books
    puts 'No books found. Please add some books!' if @books.empty?

    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts ''
  end

  def create_book
    print 'Title : '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
    puts ''
  end

  attr_reader :books
end
