# frozen_string_literal: true

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  #  rental = Rental.new(movie, 3)
  #  => #<Rental:0x0000000114f77eb0
  #  @days_rented=3,
  #  @movie=#<Movie:0x00000001145d0cb8 @price_code=2, @title="super mario">>

  def charge
    # determine amounts for each line
    result = 0
    case movie.price_code
      # when Movie::REGULAR
    when 0
      result += 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
      # when Movie::NEW_RELEASE
    when 1
      result += days_rented * 3
      # when Movie::CHILDRENS
    when 2
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end
    result
  end

  def frequent_renter_points
    # add bonus for a two day new release rental
    # movie.price_code == (Movie.NEW_RELEASE && days_rented > 1) ? 2 : 1
    movie.price_code == (1 && days_rented > 1) ? 2 : 1
  end
end
