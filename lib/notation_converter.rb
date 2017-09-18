# Class with static methods responsible for converting hashes between snake and camel case notations
class NotationConverter

  def self.convert_input(input, &conversion_logic)

    unless input.nil?

      new_input = {}

      if input.kind_of? Hash
        input.each_pair do |k,v|
          new_k = conversion_logic.call(k)
          new_input[new_k] = (convert_input v, &conversion_logic)
        end
      elsif input.kind_of? Array
        new_input = input.map do |elem|
          convert_input elem, &conversion_logic
        end
      else
        new_input = input
      end

      new_input
    end

  end

  def self.return_val (k, to_symbol)
    (to_symbol) ? k.to_sym : k
  end

  # Converts passed input to camelCase notation (lower or upper based on passed type param)
  #
  # @param input [Hash|Array] input in snake_notation
  # @param type [Symbol] the format type, `:lower` or `:upper` (default ':lower')
  # @param to_symbol [Boolean] default false (defines if returned keys will be symbols or strings)
  # @return [Hash|Array] input converted into the camelCase notation
  def self.to_camel(input, type = :lower, to_symbol = false)
    conversion_logic = lambda do |k|
      new_k = k.to_s.split('_').map.with_index{ |e, i| (i == 0 && type != :upper) ? e.downcase : (e.slice(0,1).capitalize + e.slice(1..-1).downcase) }.join
      return_val new_k, to_symbol
    end
    convert_input input, &conversion_logic
  end

  # Converts passed input to (Upper) CamelCase notation
  #
  # @param input [Hash|Array] input in snake_notation
  # @param to_symbol [Boolean] default false (defines if returned keys will be symbols or strings)
  # @return [Hash|Array] input converted into the (Upper) CamelCase notation
  def self.to_upper_camel(input, to_symbol = false)
    to_camel input, :upper, to_symbol
  end

  # Converts passed input to (lower) camelCase notation
  #
  # @param input [Hash|Array] input in snake_notation
  # @param to_symbol [Boolean] default false (defines if returned keys will be symbols or strings)
  # @return [Hash|Array] input converted into the (lower) camelCase notation
  def self.to_lower_camel(input, to_symbol = false)
    to_camel input, :lower, to_symbol
  end

  # Converts passed input to snake_notation
  #
  # @param input [Hash|Array] input in camelCase notation
  # @param to_symbol [Boolean] default false (defines if returned keys will be symbols or strings)
  # @return [Hash|Array] input converted into the snake_notation
  def self.to_snake(input, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.gsub(/(.)([A-Z])/,'\1_\2').downcase
      return_val new_k, to_symbol
    end
    convert_input input, &conversion_logic

  end

  private_class_method :convert_input, :return_val
end