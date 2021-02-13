require 'pry'
require_relative './cat.rb'
require_relative './dog.rb'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |pet| pet.owner == self }
  end

  def dogs
    Dog.all.select { |pet| pet.owner == self }
  end

  def buy_cat(cat)
    #! I should be able to pick fluffy and set myself as fluffy's new owner
    #! What do I pick the fluffy object out of?
    my_cat = Cat.new(cat, self)
    my_cat
  end

  def buy_dog(dog)
    #! I should be able to pick fluffy and set myself as fluffy's new owner
    #! What do I pick the fluffy object out of?
    my_dog = Dog.new(dog, self)
    my_dog
  end

  def walk_dogs
    my_dogs = Dog.all.select { |pet| pet.owner == self }
    my_dogs.collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    my_cats = Cat.all.select { |pet| pet.owner == self }
    my_cats.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs_for_sale = self.dogs
    # sold_dogs = dogs_for_sale.collect do |dog|
    #   dog.owner = nil
    # end
    sold_dogs = dogs_for_sale.collect do |dog|
      dog.mood = "nervous"
    end
    cats_for_sale = self.cats
    # sold_cats = cats_for_sale.collect do |cat|
    #   cat.owner = nil
    # end
    sold_cats = cats_for_sale.collect do |cat|
      cat.mood = "nervous"
    end
    sold_my_dogs = self.dogs
    sold_my_dogs.collect { |dog| dog.owner = nil}
    sold_my_cats = self.cats
    sold_my_cats.collect { |cat| cat.owner = nil}
  end

  def list_pets
    my_dogs = self.dogs.count
    my_cats = self.cats.count
    "I have #{my_dogs} dog(s), and #{my_cats} cat(s)."
  end
end