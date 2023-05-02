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
    total_amount = 0
    frequent_renter_points = 0

    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      this_amount = 0
      # determine amounts for each line
      case element.movie.price_code
      # when Movie::REGULAR
      when 0
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      # when Movie::NEW_RELEASE
      when 1
        this_amount += element.days_rented * 3
      # when Movie::CHILDRENS
      when 2
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end
      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      # if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1

      if element.movie.price_code == 1 && element.days_rented > 1
        frequent_renter_points += 1
      end
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end
    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
