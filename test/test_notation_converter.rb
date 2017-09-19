require 'minitest/autorun'
require 'notation_converter'

class NotationConverterTest < Minitest::Test

  # to_snake_passed

  def snake_passed_hash
    input =  { 'myProp' => 'myValue'}
    expected_output = { 'my_prop' => 'myValue'}

    assert_equal (NotationConverter.to_snake input), expected_output
  end

  def snake_passed_hash_to_sym
    input =  { 'myProp' => 'myValue'}
    expected_output = { :my_prop => 'myValue'}

    assert_equal (NotationConverter.to_snake input, true), expected_output
  end

  def snake_passed_nil
    assert_equal (NotationConverter.to_snake nil), nil
  end

  def snake_passed_array
    input =  [
        { 'myPropA' => 'myValueA'},
        { 'myPropB' => 'myValueB'}
    ]
    expected_output = [
        { 'my_prop_a' => 'myValueA'},
        { 'my_prop_b' => 'myValueB'}
    ]

    assert_equal (NotationConverter.to_snake input), expected_output
  end

  def snake_passed_array_to_sym
    input =  [
        { 'myPropA' => 'myValueA'},
        { 'myPropB' => 'myValueB'}
    ]
    expected_output = [
        { :my_prop_a => 'myValueA'},
        { :my_prop_b => 'myValueB'}
    ]

    assert_equal (NotationConverter.to_snake input, true), expected_output
  end

  def test_to_snake
    snake_passed_hash
    snake_passed_hash_to_sym

    snake_passed_nil

    snake_passed_array
    snake_passed_array_to_sym
  end

  # to_lower_camel

  def lower_camel_passed_hash

    input =  { 'my_prop' => 'my_value'}
    expected_output = { 'myProp' => 'my_value'}

    assert_equal (NotationConverter.to_lower_camel input), expected_output

  end

  def lower_camel_passed_hash_to_sym

    input =  { 'my_prop' => 'my_value'}
    expected_output = { :myProp => 'my_value'}

    assert_equal (NotationConverter.to_lower_camel input, true), expected_output

  end

  def lower_camel_passed_nil
    assert_equal (NotationConverter.to_lower_camel nil), nil
  end

  def lower_camel_passed_array

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_lower_camel input), expected_output

  end

  def lower_camel_passed_array_to_sym

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { :myPropA => 'my_value'},
        { :myPropB => 'my_value'}
    ]

    assert_equal (NotationConverter.to_lower_camel input, true), expected_output

  end


  def test_to_lower_camel
    lower_camel_passed_hash
    lower_camel_passed_hash_to_sym

    lower_camel_passed_nil

    lower_camel_passed_array
    lower_camel_passed_array_to_sym
  end

  # to_upper_camel

  def upper_camel_passed_hash

    input =  { 'my_prop' => 'my_value'}
    expected_output = { 'MyProp' => 'my_value'}

    assert_equal (NotationConverter.to_upper_camel input), expected_output

  end

  def upper_camel_passed_hash_to_sym

    input =  { 'my_prop' => 'my_value'}
    expected_output = { :MyProp => 'my_value'}

    assert_equal (NotationConverter.to_upper_camel input, true), expected_output

  end

  def upper_camel_passed_nil
    assert_equal (NotationConverter.to_upper_camel nil), nil

  end

  def upper_camel_passed_array

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'MyPropA' => 'my_value'},
        { 'MyPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_upper_camel input), expected_output

  end

  def upper_camel_passed_array_to_sym

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { :MyPropA => 'my_value'},
        { :MyPropB => 'my_value'}
    ]

    assert_equal (NotationConverter.to_upper_camel input, true), expected_output

  end

  def test_to_upper_camel
    upper_camel_passed_hash
    upper_camel_passed_hash_to_sym

    upper_camel_passed_nil

    upper_camel_passed_array
    upper_camel_passed_array_to_sym
  end

  # to_camel

  def camel_passed_nil
    assert_equal (NotationConverter.to_lower_camel nil), nil
  end

  def camel_passed_nil_lower
    assert_equal (NotationConverter.to_lower_camel nil, :lower), nil
  end

  def camel_passed_nil_any
    assert_equal (NotationConverter.to_lower_camel nil, :any_trash), nil
  end

  def camel_passed_hash

    input =  { 'my_prop_a' => 'my_value'}
    expected_output = { 'myPropA' => 'my_value'}

    assert_equal (NotationConverter.to_camel input), expected_output

  end

  def camel_passed_hash_lower
    input =  { 'My_pRop_A' => 'my_value'}
    expected_output = { 'myPropA' => 'my_value'}

    assert_equal (NotationConverter.to_camel input, :lower), expected_output
  end

  def camel_passed_hash_upper
    input =  { 'my_prop_a' => 'my_value'}
    expected_output = { 'MyPropA' => 'my_value'}

    assert_equal (NotationConverter.to_camel input, :upper), expected_output
  end

  def camel_passed_hash_lower_to_sym
    input =  { 'my_propA' => 'my_value'}
    expected_output = { :myPropa => 'my_value'}

    assert_equal (NotationConverter.to_camel input, :lower, true), expected_output
  end

  def camel_passed_hash_upper_to_sym
    input =  { 'my_prop_A' => 'my_value'}
    expected_output = { :MyPropA => 'my_value'}

    assert_equal (NotationConverter.to_camel input, :upper, true), expected_output
  end

  def camel_passed_hash_any
    input =  { 'my_prop' => 'my_value'}
    expected_output = { 'myProp' => 'my_value'}

    assert_equal (NotationConverter.to_camel input, :any_trash), expected_output
  end

  def camel_passed_array

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input), expected_output

  end

  def camel_passed_array_lower

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input, :lower), expected_output

  end

  def camel_passed_array_upper

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'MyPropA' => 'my_value'},
        { 'MyPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input, :upper), expected_output

  end

  def camel_passed_array_lower_to_sym

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { :myPropA => 'my_value'},
        { :myPropB => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input, :lower, true), expected_output

  end

  def camel_passed_array_upper_to_sym

    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { :MyPropA => 'my_value'},
        { :MyPropB => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input, :upper, true), expected_output

  end

  def camel_passed_array_any
    input =  [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    expected_output = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    assert_equal (NotationConverter.to_camel input, :any_trash), expected_output
  end

  def test_to_camel
    camel_passed_nil
    camel_passed_nil_lower
    camel_passed_nil_any

    camel_passed_hash
    camel_passed_hash_lower
    camel_passed_hash_upper
    camel_passed_hash_lower_to_sym
    camel_passed_hash_upper_to_sym
    camel_passed_hash_any

    camel_passed_array
    camel_passed_array_lower
    camel_passed_array_upper
    camel_passed_array_lower_to_sym
    camel_passed_array_upper_to_sym
    camel_passed_array_any
  end

end
