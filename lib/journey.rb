require 'station'

class Journey

    PENALTY_FARE = 6

    def initialize(entry_station: station)
        @amount = PENALTY_FARE
        @is_complete = false
        @entry_station = entry_station
        @station

    end

    def complete?
      !! @is_complete
    end

    def fare
      @amount
    end

    def finish
      @entry_station
    end

    def entry_station
      @entry_station
    end







end
