class OysterCard

    MAXIMUM_BALANCE = 90

    attr_accessor :balance, :touch_in

    def initialize (balance = 0)
      @balance = balance
      @CardState = false 
    end

    def top_up(amount)
        fail 'Maximum balance of 90 exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

 
    def in_journey?
      @CardState
    end


    def touch_in

      @CardState = true
    end 

    def touch_out 
      @CardState = false
    end 
    
  end
