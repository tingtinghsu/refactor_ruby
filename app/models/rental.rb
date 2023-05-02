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
end
