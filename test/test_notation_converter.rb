require 'minitest/autorun'
require 'notation_converter'

class NotationConverterTest < Minitest::Test

  # to_snake_passed

  def test_to_snake_passed_hash
    hash = { 'myProp' => 'myValue'}
    as_snake = { 'my_prop' => 'myValue'}

    as_snake_result = NotationConverter.to_snake hash
    assert_equal as_snake_result, as_snake
  end

  def test_to_snake_passed_hash_to_symbol
    hash = { 'myProp' => 'myValue'}
    as_snake = { :my_prop => 'myValue'}

    as_snake_result = NotationConverter.to_snake hash, true
    assert_equal as_snake_result, as_snake
  end

  def test_to_snake_passed_nil
    as_snake_result = NotationConverter.to_snake nil
    assert_equal as_snake_result, nil
  end

  # to_lower_camel

  def test_to_lower_camel_passed_hash

    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_lower_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def test_to_lower_camel_passed_hash_to_symbol

    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { :myProp => 'my_value'}

    as_lower_camel_result = NotationConverter.to_lower_camel hash, true
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def test_to_lower_camel_passed_nil
    as_lower_camel_result = NotationConverter.to_lower_camel nil
    assert_equal as_lower_camel_result, nil
  end

  # to_upper_camel

  def test_to_upper_camel_passed_hash

    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { 'MyProp' => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel hash
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def test_to_upper_camel_passed_hash_to_symbol

    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { :MyProp => 'my_value'}

    as_upper_camel_result = NotationConverter.to_upper_camel hash, true
    assert_equal as_upper_camel_result, as_upper_camel

  end

  def test_to_upper_camel_passed_nil
    as_upper_camel_result = NotationConverter.to_upper_camel nil
    assert_equal as_upper_camel_result, nil

  end

  # to_camel

  def test_to_camel_passed_nil
    as_camel_result = NotationConverter.to_lower_camel nil
    assert_equal as_camel_result, nil
  end

  def test_to_camel_passed_nil_lower
    as_camel_result = NotationConverter.to_lower_camel nil, :lower
    assert_equal as_camel_result, nil
  end

  def test_to_camel_passed_nil_any
    as_camel_result = NotationConverter.to_lower_camel nil, :any_trash
    assert_equal as_camel_result, nil
  end

  def test_to_camel_passed_hash

    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash
    assert_equal as_lower_camel_result, as_lower_camel

  end

  def test_to_camel_passed_hash_lower
    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :lower
    assert_equal as_lower_camel_result, as_lower_camel
  end

  def test_to_camel_passed_hash_upper
    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { 'MyProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :upper
    assert_equal as_lower_camel_result, as_upper_camel
  end

  def test_to_camel_passed_hash_lower_to_symbol
    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { :myProp => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :lower, true
    assert_equal as_lower_camel_result, as_lower_camel
  end

  def test_to_camel_passed_hash_upper_to_symbol
    hash = { 'my_prop' => 'my_value'}
    as_upper_camel = { :MyProp => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :upper, true
    assert_equal as_lower_camel_result, as_upper_camel
  end


  def test_to_camel_passed_hash_any
    hash = { 'my_prop' => 'my_value'}
    as_lower_camel = { 'myProp' => 'my_value'}

    as_lower_camel_result = NotationConverter.to_camel hash, :any_trash
    assert_equal as_lower_camel_result, as_lower_camel
  end

end
