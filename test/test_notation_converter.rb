require 'minitest/autorun'
require 'notation_converter'

class NotationConverterTest < Minitest::Test

  # to_snake_passed

  def snake_passed_hash
    hash = { 'myProp' => 'myValue'}
    as_snake = { 'my_prop' => 'myValue'}

    as_snake_result = NotationConverter.to_snake hash
    assert_equal as_snake_result, as_snake
  end

  def snake_passed_hash_to_sym
    hash = { 'myProp' => 'myValue'}
    as_snake = { :my_prop => 'myValue'}

    as_snake_result = NotationConverter.to_snake hash, true
    assert_equal as_snake_result, as_snake
  end

  def snake_passed_nil
    as_snake_result = NotationConverter.to_snake nil
    assert_equal as_snake_result, nil
  end

  def snake_passed_array
    hash = [
        { 'myPropA' => 'myValueA'},
        { 'myPropB' => 'myValueB'}
    ]
    as_snake = [
        { 'my_prop_a' => 'myValueA'},
        { 'my_prop_b' => 'myValueB'}
    ]

    as_snake_result = NotationConverter.to_snake hash
    assert_equal as_snake_result, as_snake
  end

  def snake_passed_array_to_sym
    hash = [
        { 'myPropA' => 'myValueA'},
        { 'myPropB' => 'myValueB'}
    ]
    as_snake = [
        { :my_prop_a => 'myValueA'},
        { :my_prop_b => 'myValueB'}
    ]

    as_snake_result = NotationConverter.to_snake hash, true
    assert_equal as_snake_result, as_snake
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

    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_lower_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def lower_camel_passed_hash_to_sym

    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { :myProp => 'my_value'}

    as_lower_camel_result = NotationConverter.to_lower_camel hash, true
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def lower_camel_passed_nil
    as_lower_camel_result = NotationConverter.to_lower_camel nil
    assert_equal as_lower_camel_result, nil
  end

  def lower_camel_passed_array

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_lower_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def lower_camel_passed_array_to_sym

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { :myPropA => 'my_value'},
        { :myPropB => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_lower_camel hash, true
    assert_equal as_lower_camel_result, as_lower_camel

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

    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { 'MyProp' => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel hash
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def upper_camel_passed_hash_to_sym

    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { :MyProp => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel hash, true
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def upper_camel_passed_nil
    as_upper_camel_result = NotationConverter.to_upper_camel nil
    assert_equal as_upper_camel_result, nil

  end

  def upper_camel_passed_array

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'MyPropA' => 'my_value'},
        { 'MyPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_upper_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def upper_camel_passed_array_to_sym

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { :MyPropA => 'my_value'},
        { :MyPropB => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_upper_camel hash, true
    assert_equal as_lower_camel_result, as_lower_camel

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

    hash = { 'my_prop_a' => 'my_value'}
    as_lower_camel = { 'myPropA' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_hash_lower
    hash = { 'My_pRop_A' => 'my_value'}
    as_lower_camel = { 'myPropA' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :lower
    assert_equal as_lower_camel, as_lower_camel_result
  end

  def camel_passed_hash_upper
    hash = { 'my_prop_a' => 'my_value'}
    as_upper_camel = { 'MyPropA' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :upper
    assert_equal as_lower_camel_result, as_upper_camel
  end

  def camel_passed_hash_lower_to_sym
    hash = { 'my_propA' => 'my_value'}
    as_lower_camel = { :myPropa => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :lower, true
    assert_equal as_lower_camel_result, as_lower_camel
  end

  def camel_passed_hash_upper_to_sym
    hash = { 'my_prop_A' => 'my_value'}
    as_upper_camel = { :MyPropA => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :upper, true
    assert_equal as_lower_camel_result, as_upper_camel
  end

  def camel_passed_hash_any
    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :any_trash
    assert_equal as_lower_camel_result, as_lower_camel
  end

  def camel_passed_array

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_array_lower

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash, :lower
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_array_upper

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'MyPropA' => 'my_value'},
        { 'MyPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash, :upper
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_array_lower_to_sym

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { :myPropA => 'my_value'},
        { :myPropB => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash, :lower, true
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_array_upper_to_sym

    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { :MyPropA => 'my_value'},
        { :MyPropB => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash, :upper, true
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def camel_passed_array_any
    hash = [
        { 'my_prop_a' => 'my_value'},
        { 'my_prop_b' => 'my_value'}
    ]
    as_lower_camel = [
        { 'myPropA' => 'my_value'},
        { 'myPropB' => 'my_value'}
    ]

    as_lower_camel_result = NotationConverter.to_camel hash, :any_trash
    assert_equal as_lower_camel_result, as_lower_camel
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
