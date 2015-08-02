class Object
  def self.const_missing(c)
    require Rulers.to_underscore(c.to_s)
    if Object.const_defined?(c)
      return Object.const_get(c)
    else
      return nil
    end
  end
end