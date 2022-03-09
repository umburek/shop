class NullProduct
  def name
    'N/A'
  end

  private
  def method_missing(*args, &block)
    self
  end
end