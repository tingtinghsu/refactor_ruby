# frozen_string_literal: true

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end

  # movie = Movie.new("super mario", 2)
  # => #<Movie:0x00000001145d0cb8 @price_code=2,#  @title="super mario">
end
