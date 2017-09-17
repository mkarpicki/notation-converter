class NotationConverter

  def self.convert_hash(hash, &conversion_logic)

    unless hash.nil?

      new_hash = {}

      if hash.kind_of? Hash
        hash.each_pair do |k,v|
          new_k = conversion_logic.call(k)
          new_hash[new_k] = (convert_hash v, &conversion_logic)
        end
      elsif hash.kind_of? Array
        new_hash = hash.map do |elem|
          convert_hash elem, &conversion_logic
        end
      else
        new_hash = hash
      end

      new_hash
    end

  end

  def self.return_val (k, to_symbol)
    (to_symbol) ? k.to_sym : k
  end

  def self.to_camel(hash, type = :lower, to_symbol = false)
    if type == :upper
      to_upper_camel hash, to_symbol
    else
      to_lower_camel hash, to_symbol
    end
  end

  def self.to_upper_camel(hash, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.to_s.split('_').map.with_index{|e, i| e.capitalize }.join
      return_val new_k, to_symbol
    end
    convert_hash hash, &conversion_logic

  end

  def self.to_lower_camel(hash, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.to_s.split('_').map.with_index{|e, i| i == 0 ? e : e.capitalize }.join
      return_val new_k, to_symbol
    end
    convert_hash hash, &conversion_logic

  end

  def self.to_snake(hash, to_symbol = false)

    conversion_logic = lambda do |k|
      new_k = k.gsub(/(.)([A-Z])/,'\1_\2').downcase
      return_val new_k, to_symbol
    end
    convert_hash hash, &conversion_logic

  end

  private_class_method :convert_hash, :return_val
end