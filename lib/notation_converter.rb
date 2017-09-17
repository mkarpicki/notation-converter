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

  def self.to_camel(input, type = :lower, to_symbol = false)
    if type == :upper
      to_upper_camel input, to_symbol
    else
      to_lower_camel input, to_symbol
    end
  end

  def self.to_upper_camel(input, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.to_s.split('_').map.with_index{|e, i| e.capitalize }.join
      return_val new_k, to_symbol
    end
    convert_input input, &conversion_logic

  end

  def self.to_lower_camel(input, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.to_s.split('_').map.with_index{|e, i| i == 0 ? e : e.capitalize }.join
      return_val new_k, to_symbol
    end
    convert_input input, &conversion_logic

  end

  def self.to_snake(input, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.gsub(/(.)([A-Z])/,'\1_\2').downcase
      return_val new_k, to_symbol
    end
    convert_input input, &conversion_logic

  end

  private_class_method :convert_input, :return_val
end