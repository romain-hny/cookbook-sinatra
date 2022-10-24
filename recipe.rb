class Recipe
  attr_reader :name, :description

  #, :rating, :preptime
  #attr_accessor :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    # @rating = attributes[:rating]
    # @preptime = attributes[:preptime]
    # @done = attributes[:done]
  end
end
