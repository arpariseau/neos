require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test

  # def test_a_date_returns_a_list_of_neos
  #   results = NearEarthObjects.find_neos_by_date('2019-03-30')
  #   assert_equal '(2019 GD4)', results[:asteroid_list][0][:name]
  # end

  def setup
    @test = NearEarthObjects.new('2019-03-30')
  end

  def test_existence
    assert_instance_of NearEarthObjects, @test
  end

  def test_formatting_asteroid_data
    test_asteroid = @test.format_asteroid_data.first
    assert_equal '(2019 GD4)', test_asteroid[:name]
    assert_equal '61 ft', test_asteroid[:diameter]
    assert_equal '911947 miles', test_asteroid[:miss_distance]
  end

  def test_largest_asteroid_diameter
    assert_equal 10233, @test.largest_asteroid_diameter
  end

  def test_find_total_number_of_asteroids
    assert_equal 12, @test.total_number_of_asteroids
  end
end
