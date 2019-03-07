require './lib/bike.rb'
class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Capacity is reached' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end
end
