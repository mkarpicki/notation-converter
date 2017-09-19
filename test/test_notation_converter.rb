require 'minitest/autorun'
require 'notation_converter'

class NotationConverterTest < Minitest::Test

  # to_snake_passed

  def snake_passed_hash
    input =  { 'myProp' => 'myValue'}
    expected_output = { 'my_prop' => 'myValue'}

    expected_output_result = NotationConverter.to_snake input
    assert_equal expected_output_result, expected_output
  end

  def snake_passed_hash_to_sym
    input =  { 'myProp' => 'myValue'}
    expected_output = { :my_prop => 'myValue'}

    expected_output_result = NotationConverter.to_snake input, true
    assert_equal expected_output_result, expected_output
  end

  def snake_passed_nil
    expected_output_result = NotationConverter.to_snake nil
    assert_equal expected_output_result, nil
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

    expected_output_result = NotationConverter.to_snake input
    assert_equal expected_output_result, expected_output
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

    expected_output_result = NotationConverter.to_snake input, true
    assert_equal expected_output_result, expected_output
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

    expected_output_result = NotationConverter.to_lower_camel input
    assert_equal expected_output_result, expected_output

  end

  def lower_camel_passed_hash_to_sym

    input =  { 'my_prop' => 'my_value'}
    expected_output = { :myProp => 'my_value'}

    expected_output_result = NotationConverter.to_lower_camel input, true
    assert_equal expected_output_result, expected_output

  end

  def lower_camel_passed_nil
    expected_output_result = NotationConverter.to_lower_camel nil
    assert_equal expected_output_result, nil
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

    expected_output_result = NotationConverter.to_lower_camel input
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_lower_camel input, true
    assert_equal expected_output_result, expected_output

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
    as_upper_camel = { 'MyProp' => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel input
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def upper_camel_passed_hash_to_sym

    input =  { 'my_prop' => 'my_value'}
    as_upper_camel = { :MyProp => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel input, true
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def upper_camel_passed_nil
    as_upper_camel_result = NotationConverter.to_upper_camel nil
    assert_equal as_upper_camel_result, nil

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

    expected_output_result = NotationConverter.to_upper_camel input
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_upper_camel input, true
    assert_equal expected_output_result, expected_output

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
    as_camel_result = NotationConverter.to_lower_camel nil
    assert_equal as_camel_result, nil
  end

  def camel_passed_nil_lower
    as_camel_result = NotationConverter.to_lower_camel nil, :lower
    assert_equal as_camel_result, nil
  end

  def camel_passed_nil_any
    as_camel_result = NotationConverter.to_lower_camel nil, :any_trash
    assert_equal as_camel_result, nil
  end

  def camel_passed_hash

    input =  { 'my_prop_a' => 'my_value'}
    expected_output = { 'myPropA' => 'my_value'}

    expected_output_result = NotationConverter.to_camel input
    assert_equal expected_output_result, expected_output

  end

  def camel_passed_hash_lower
    input =  { 'My_pRop_A' => 'my_value'}
    expected_output = { 'myPropA' => 'my_value'}

    expected_output_result = NotationConverter.to_camel input, :lower
    assert_equal expected_output, expected_output_result
  end

  def camel_passed_hash_upper
    input =  { 'my_prop_a' => 'my_value'}
    as_upper_camel = { 'MyPropA' => 'my_value'}

    expected_output_result = NotationConverter.to_camel input, :upper
    assert_equal expected_output_result, as_upper_camel
  end

  def camel_passed_hash_lower_to_sym
    input =  { 'my_propA' => 'my_value'}
    expected_output = { :myPropa => 'my_value'}

    expected_output_result = NotationConverter.to_camel input, :lower, true
    assert_equal expected_output_result, expected_output
  end

  def camel_passed_hash_upper_to_sym
    input =  { 'my_prop_A' => 'my_value'}
    as_upper_camel = { :MyPropA => 'my_value'}

    expected_output_result = NotationConverter.to_camel input, :upper, true
    assert_equal expected_output_result, as_upper_camel
  end

  def camel_passed_hash_any
    input =  { 'my_prop' => 'my_value'}
    expected_output = { 'myProp' => 'my_value'}

    expected_output_result = NotationConverter.to_camel input, :any_trash
    assert_equal expected_output_result, expected_output
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

    expected_output_result = NotationConverter.to_camel input
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_camel input, :lower
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_camel input, :upper
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_camel input, :lower, true
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_camel input, :upper, true
    assert_equal expected_output_result, expected_output

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

    expected_output_result = NotationConverter.to_camel input, :any_trash
    assert_equal expected_output_result, expected_output
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
