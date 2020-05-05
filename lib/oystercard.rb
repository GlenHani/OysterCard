class OysterCard

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    attr_accessor :balance, :entry_station

    def initialize (balance = 0)
      @balance = balance
      @entry_station
    end

    def top_up(amount)
        fail 'Maximum balance of 90 exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_journey?
      !!entry_station
    end


    def touch_in(station)
      fail "Insufficient balance to touch in" if balance < MINIMUM_BALANCE
      @entry_station = station
    end

    def touch_out
      deduct(MINIMUM_BALANCE)
      @entry_station = nil
    end

    private

    def deduct(amount)
      @balance -= amount
    end

  end
