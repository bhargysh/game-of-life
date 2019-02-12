require_relative './rule'
class AliveRule < Rule
  def checker
    :alive?
  end

end
