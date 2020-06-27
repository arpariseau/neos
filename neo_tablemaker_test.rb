require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'
require_relative 'neo_tablemaker'

class NEOTablemakerTest < Minitest::Test

  def setup
    @test = NEOTablemaker.new
    @asteroid_data = NearEarthObjects.new('2019-03-30').format_asteroid_data
  end

  def test_existence
    assert_instance_of NEOTablemaker, @test
  end

  def test_formatting_columns
    expected_col_data = {name: {label: "Name", width: 17},
                         diameter: {label: "Diameter", width: 8},
                         miss_distance: {label: "Missed The Earth By:", width: 20}}
    assert_equal expected_col_data, @test.format_columns(@asteroid_data)
  end

  def test_formatting_header
    col_data = @test.format_columns(@asteroid_data)
    test_header = "| Name              | Diameter | Missed The Earth By: |"
    assert_equal test_header, @test.format_header(col_data)
  end

  def test_formatting_divider
    col_data = @test.format_columns(@asteroid_data)
    test_divider = "+-------------------+----------+----------------------+"
    assert_equal test_divider, @test.format_divider(col_data)
  end

  def test_formatting_rows
    col_data = @test.format_columns(@asteroid_data)
    test_row = "(2019 GD4)        | 61 ft    | 911947 miles        "
    assert_equal test_row, @test.format_row_data(@asteroid_data.first, col_data)
  end

end
