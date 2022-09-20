class Cheese < ApplicationRecord
  
  def summary
    "#{name}: $#{price}"
  end

  def show

end
