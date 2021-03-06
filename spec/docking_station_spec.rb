require 'docking_station'
require 'bike'

describe DockingStation do
  # let's upgrade our syntax, to:
  # use a '#' before a method name
  # to imply that it is an instance
  # method. Also look: nested describes!
  # describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    # it 'raises an error when the capacity is reached' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect {subject.dock(Bike.new)}.to raise_error 'Capacity is reached'
    # end

    it 'only docks no more than 20 bikes' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect {subject.dock(Bike.new)}.to raise_error 'Capacity is reached'
    end
end
