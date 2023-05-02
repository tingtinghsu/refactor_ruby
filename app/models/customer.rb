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
    frequent_renter_points = 0

    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # add frequent renter points
      frequent_renter_points += element.frequent_renter_points

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end
