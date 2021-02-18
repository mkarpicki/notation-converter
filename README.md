[![Build Status](https://travis-ci.org/mkarpicki/notation-converter.svg?branch=master)](https://travis-ci.org/mkarpicki/notation-converter)

# NotationConverter

NotationConverter allows to convert between snake_notation and camelCase notation (both ways)
Published: https://rubygems.org/gems/notation_converter

## Installing

```
gem install notation_converter
```

## Static methods

### NotationConverter.to_snake

Converts passed input to snake_notation

*Examples*

```
input = { 'myProp' => 'myValue'}
output = NotationConverter.to_snake input
# { 'my_prop' => 'myValue'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_snake input, true
# { :my_prop => 'myValue'}

input = [{ 'myPropA' => 'myValue'}, { 'myPropB' => 'myValue'}]
output = NotationConverter.to_snake input, true
# [{ :my_prop_a => 'myValue'}, { :my_prop_b => 'myValue'}]

```


### NotationConverter.to_lower_camel

Converts passed input to (lower) camelCase notation

*Examples*

```
input = { 'my_prop' => 'my_value'}
output = NotationConverter.to_lower_camel hash
# { 'myProp' => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_lower_camel hash, true
# { :myProp => 'my_value'}

```

### NotationConverter.to_upper_camel

Converts passed input to (Upper) CamelCase notation

*Examples*

```
input = { 'my_prop' => 'my_value'}
output = NotationConverter.to_upper_camel hash
# { 'MyProp' => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_upper_camel hash, true
# { :MyProp => 'my_value'}

```

### NotationConverter.to_camel

Converts passed input to camelCase notation (lower or upper based on passed type param)

*Examples*

```
input = { 'my_prop' => 'my_value'}
output = NotationConverter.to_camel hash
# { 'myProp' => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_camel hash, :lower
# { 'myProp' => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_camel hash, :upper
# { 'MyProp' => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_camel hash, :lower, true
# { :myProp => 'my_value'}

input = { 'myProp' => 'myValue'}
output = NotationConverter.to_camel hash, :upper, true
# { :MyProp => 'my_value'}

```


