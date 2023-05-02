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
  # customer.add_rental(movie)
  # => [#<Movie:0x00000001145d0cb8  @price_code=2,  @title="super mario">]
  #
  # customer
  # => #<Customer:0x0000000107053590
  #  @name="ting",
  #  @rentals=
  #   [#<Movie:0x00000001145d0cb8 @price_code=2, @title="super mario">]>
  #
  # customer.rentals
  # => [#<Movie:0x00000001145d0cb8
  #   @price_code=2,
  #   @title="super mario">]
end
