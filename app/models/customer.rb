# frozen_string_literal: true

class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  # customer = Customer.new("ting")
  # => #<Customer:0x0000000107053590 @name="ting", @rentals=[]>
  #
  # customer.add_rental(rental)
  # => [#<Rental:0x000000012aa79538
  #     @days_rented=3,
  #     @movie=
  #     #<Movie:0x0000000129e44038
  #     @price_code=2,
  #     @title="super mario">>]
  #
  # customer
  # => #<Customer:0x0000000129dc7d08
  # @name="ting",
  #   @rentals=
  #   [#<Rental:0x000000012aa79538
  #    @days_rented=3,
  #    @movie=
  #    #<Movie:0x0000000129e44038
  #    @price_code=2,
  #    @title="super mario">>]>
  #
  # customer.rentals
  # => [#<Rental:0x000000012aa79538
  #     @days_rented=3,
  #     @movie=
  #     #<Movie:0x0000000129e44038
  #     @price_code=2,
  #     @title="super mario">>]
  #
  # customer.statement
  # => "Rental Record for ting\n\t
  #     super mario\t 1.5\n
  #     Amount owed is 1.5\n
  #     You earned 1 frequent renter points"

  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  #   customer.html_statement
  # => "<h1>Rentals for <em>ting</em></h1><p>\n\tsuper mario: 1.5<br>\n<p>You owe <em>1.5</em><p>\nOn this rental you earned <em>1</em> frequent renter points<p>"

  def html_statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + ": " + element.charge.to_s + "<br>\n"
    end
    # add footer lines
    result += "<p>You owe <em>#{total_charge}</em><p>\n"
    result += "On this rental you earned " +
      "<em>#{total_frequent_renter_points}</em> " +
      "frequent renter points<p>"
    result
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end
