require 'station'
require 'oystercard'

class Journey

    PENALTY_FARE = 6

    def initialize(entry_station: station)
        @amount = PENALTY_FARE
        @is_complete = false
        @entry_station = entry_station
        @station


    end

    def complete?
      !!@is_complete
    end

    def fare
      if @is_complete == true
        @amount = 1
      else
        @amount
      end

    end

    def finish(exit_station)
      @station = exit_station
    end

    def entry_station
      @entry_station
    end

    def check_in
      @is_complete = true
    end





end
