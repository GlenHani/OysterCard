class OysterCard

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

    attr_accessor :balance, :Station

    def initialize (balance = 0)
      @balance = balance
      @CardStatus
      @In_Station 
      @Out_Station 
    end

    def top_up(amount)
        fail 'Maximum balance of 90 exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_journey?
      @CardStatus 
    end

    def touch_in(station)
      fail "Insufficient balance to touch in" if balance < MINIMUM_BALANCE
      @In_Station  = station 
      @CardStatus = true

    end

    def touch_out(station)
      deduct(MINIMUM_BALANCE)
      @CardStatus = false
      @Out_Station = station
    end

    def journeys
      journeys = Hash.new
    end 

    private

    def deduct(amount)
      @balance -= amount
    end

  end
