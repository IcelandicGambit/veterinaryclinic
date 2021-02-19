
require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet.rb'
require './lib/veterinarian.rb'
require './lib/customer.rb'

class VeterinarianTest < Minitest::Test

  def setup
    @mercy = Pet.new({name: "Mercy", type: :cat, age: 5})
    @cowboy = Pet.new({name: "Cowboy", type: :cat, age: 1})
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @joel = Customer.new("Joel", 2)
    @alex = Customer.new("Alex", 3)
    @joel.adopt(@mercy)
    @joel.adopt(@samson)
    @alex.adopt(@cowboy)
    # @vet = Veterinarian.new({name: "Andrew", customers: [@joel, @alex]})
    @vet = Veterinarian.new({name: "Andrew", customers: [@joel, @alex], pets: [@joel.pets, @alex.pets]})
  end

  def test_it_exists
    assert_instance_of Veterinarian, @vet
  end

  def test_it_has_attributes
    assert_equal "Andrew", @vet.name
    assert_equal [@joel, @alex], @vet.customers
  end

  def test_you_can_sort_pets_by_age
    assert_equal [@mercy, @samson, @cowboy], @vet.pets_by_age
  end

  def test_it_can_count_pets
    assert_equal [2, 1], @vet.pets_by_customer

  end
end
