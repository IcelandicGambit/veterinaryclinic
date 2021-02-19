

# pry(main)> joel.outstanding_balance
# # => 0
#
# pry(main)> joel.charge(15)
#
# pry(main)> joel.charge(7)
#
# pry(main)> joel.outstanding_balance
# # => 22



require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/pet'


class CustomerTest < Minitest::Test

  def setup
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  def test_it_exists
    assert_instance_of Customer, @joel
  end

  def test_it_has_attributes
    assert_equal "Joel", @joel.name
    assert_equal 2, @joel.id
    assert_equal [], @joel.pets
    assert_equal 0, @joel.outstanding_balance
  end

  def test_you_can_adopt_pets
    assert_equal [], @joel.pets
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    assert_equal [@samson, @lucy], @joel.pets
  end

  def test_you_can_charge_customers
    assert_equal 0, @joel.outstanding_balance
    @joel.charge(15)
    @joel.charge(7)
    assert_equal 22, @joel.outstanding_balance
  end
end
