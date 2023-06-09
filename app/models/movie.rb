# frozen_string_literal: true

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title, :price_code

  def initialize(title, the_price_code)
    @title = title
    self.price_code = the_price_code
  end

  def price_code=(value)
    @price_code = value
    @price = case price_code
             when REGULAR
               RegularPrice.new
             when NEW_RELEASE
               NewReleasePrice.new
             when CHILDRENS
               ChildrensPrice.new
             end
  end

  # movie = Movie.new("super mario", 2)
  # => #<Movie:0x00000001145d0cb8 @price_code=2,#  @title="super mario">

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    # add bonus for a two day new release rental
    # price_code == (Movie.NEW_RELEASE && days_rented > 1) ? 2 : 1
    price_code == (1 && days_rented > 1) ? 2 : 1
  end
end
